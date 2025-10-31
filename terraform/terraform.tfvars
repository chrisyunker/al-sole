# AWS Configuration
aws_region       = "us-east-1"

# Project
project_name     = "al-sole"

# Domain Configuration
domain_name      = "alsole.yunker.dev"
root_domain      = "yunker.dev"

# Environment
environment      = "production"

# CloudFront settings
cloudfront_price_class = "PriceClass_100"  # North America and Europe
cloudfront_default_ttl = 300               # 5 minutes
cloudfront_max_ttl     = 3600              # 1 hour

# S3 settings
enable_versioning = false
s3_bucket_name    = "al-sole-static-site"

# Additional Tags
tags = {
  Owner       = "Chris Yunker"
  Project     = "al-sole"
}
