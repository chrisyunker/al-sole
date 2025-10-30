variable "cloudflare_api_token" {}

variable "aws_region" {
  description = "AWS region for main resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "al-sole"
}

variable "root_domain" {
  description = "Root domain name (must exist in Route53)"
  type        = string
  default     = "yunker.dev"
}

variable "domain_name" {
  description = "Full domain name for the application"
  type        = string
  default     = "alsole.yunker.dev"
}

variable "environment" {
  description = "Environment name (e.g., production, staging)"
  type        = string
  default     = "prod"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for static website hosting"
  type        = string
  default     = "al-sole-static-site"
}

variable "enable_s3_logging" {
  description = "Enable S3 access logging"
  type        = bool
  default     = false
}

variable "enable_cloudfront_logging" {
  description = "Enable CloudFront access logging"
  type        = bool
  default     = false
}

variable "cloudfront_price_class" {
  description = "CloudFront price class (PriceClass_All, PriceClass_200, PriceClass_100)"
  type        = string
  default     = "PriceClass_100"

  validation {
    condition = contains([
      "PriceClass_All",
      "PriceClass_200",
      "PriceClass_100"
    ], var.cloudfront_price_class)
    error_message = "CloudFront price class must be PriceClass_All, PriceClass_200, or PriceClass_100."
  }
}

variable "cloudfront_default_ttl" {
  description = "Default TTL for CloudFront caching (in seconds)"
  type        = number
  default     = 86400  # 24 hours
}

variable "cloudfront_max_ttl" {
  description = "Maximum TTL for CloudFront caching (in seconds)"
  type        = number
  default     = 31536000  # 1 year
}

variable "index_document" {
  description = "Index document for the website"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Error document for the website"
  type        = string
  default     = "error.html"
}

variable "enable_versioning" {
  description = "Enable S3 bucket versioning"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow Terraform to destroy the S3 bucket even if it's not empty (use with caution)"
  type        = bool
  default     = false
}

variable "google_analytics_id" {
  description = "Google Analytics 4 measurement ID (format: G-XXXXXXXXXX)"
  type        = string
  default     = ""

  validation {
    condition = can(regex("^(G-[A-Z0-9]{10}|)$", var.google_analytics_id))
    error_message = "Google Analytics ID must be in the format G-XXXXXXXXXX or empty to disable         analytics."
  }
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}

