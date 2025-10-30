output "website_url" {
  description = "URL of the website"
  value       = "https://${var.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (for cache invalidation)"
  value       = module.cloudfront.distribution_hosted_zone_id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = module.cloudfront.distribution_domain_name
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3_bucket.bucket_name
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN"
  value       = module.s3_bucket.bucket_arn
}

output "acm_certificate_arn" {
  description = "ACM certificate ARN"
  value       = aws_acm_certificate.cert.arn
}

output "cloudflare_zone_id" {
  description = "Cloudflare hosted zone ID"
  value       = data.cloudflare_zone.website.zone_id
}

output "dns_records" {
  description = "DNS records created"
  value = {
    a_record    = cloudflare_dns_record.website-a
  }
}
