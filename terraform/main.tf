terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.97"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

# Configure AWS providers
provider "aws" {
  alias  = "us_east_1"
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "railmap.live"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# Local values for common configurations
locals {
  domain_name = var.domain_name
  bucket_name = var.domain_name
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}


# S3 Bucket Module
module "s3_bucket" {
  source = "./modules/s3_bucket"

  s3_bucket_name     = local.bucket_name
  environment     = var.environment
  enable_logging  = var.enable_s3_logging
  enable_versioning = var.enable_versioning

  tags = local.common_tags
}

# Automatically upload other website files (excluding index.html template)
resource "aws_s3_object" "website_files" {
  for_each = toset([
    for file in fileset("${path.root}/../website", "**/*") :
    file if !endswith(file, ".tpl") && file != "index.html"
  ])

  bucket = module.s3_bucket.bucket_name
  key    = each.value
  source = "${path.root}/../website/${each.value}"
  etag   = filemd5("${path.root}/../website/${each.value}")

  content_type = lookup({
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".json" = "application/json"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".txt"  = "text/plain"
  }, regex("\\.[^.]+$", each.value), "application/octet-stream")

  depends_on = [module.s3_bucket]
}

# ACM certificate for alsole.yunker.dev (must be in us-east-1 for CloudFront)
resource "aws_acm_certificate" "cert" {
  provider = aws.us_east_1

  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = local.common_tags
}

# Wait for certificate validation to complete
resource "aws_acm_certificate_validation" "cert" {
  provider = aws.us_east_1

  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in cloudflare_dns_record.records : record.name]

  timeouts {
    create = "5m"
  }
}

# CloudFront Distribution Module
module "cloudfront" {
  source = "./modules/cloudfront"

  depends_on = [module.s3_bucket]

  domain_name                = local.domain_name
  bucket_name               = module.s3_bucket.bucket_name
  bucket_regional_domain_name = module.s3_bucket.bucket_regional_domain_name
  bucket_arn                = module.s3_bucket.bucket_arn
  acm_certificate_arn       = aws_acm_certificate_validation.cert.certificate_arn
  enable_logging            = var.enable_cloudfront_logging

  tags = local.common_tags
}

# Cloudflare DNS settings
data "cloudflare_zone" "website" {
  filter = {
    name = var.root_domain
  }
}

resource "cloudflare_dns_record" "records" {

  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = data.cloudflare_zone.website.zone_id
  name    = each.value.name
  content = each.value.record
  type    = each.value.type
  ttl     = 60
}

resource "cloudflare_dns_record" "website-a" {
  zone_id = data.cloudflare_zone.website.zone_id
  name    = local.domain_name
  content = module.cloudfront.distribution_domain_name
  type    = "CNAME"
  ttl     = 60
}

# Process index.html template with Google Analytics
resource "aws_s3_object" "index_html" {
  bucket = module.s3_bucket.bucket_name
  key    = "index.html"

  content = templatefile("${path.root}/../website/index.html.tpl", {
    google_analytics_id = var.google_analytics_id
  })

  content_type = "text/html"
  etag         = md5(templatefile("${path.root}/../website/index.html.tpl", {
    google_analytics_id = var.google_analytics_id
  }))

  depends_on = [module.s3_bucket]
}

# Automatically invalidate CloudFront cache when website files change
resource "null_resource" "invalidate_cache" {
  # Trigger when any website file changes (including templated index.html)
  triggers = {
    file_hashes = jsonencode(concat(
      [aws_s3_object.index_html.etag],
      [for file_key, file_obj in aws_s3_object.website_files : file_obj.etag]
    ))
  }

  provisioner "local-exec" {
    command = "aws cloudfront create-invalidation --distribution-id ${module.cloudfront.                distribution_id} --paths '/*'"
  }

  depends_on = [module.cloudfront, aws_s3_object.website_files, aws_s3_object.index_html]
}
