output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.website.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.website.arn
}

output "bucket_regional_domain_name" {
  description = "Regional domain name of the S3 bucket"
  value       = aws_s3_bucket.website.bucket_regional_domain_name
}

output "bucket_hosted_zone_id" {
  description = "Hosted zone ID of the S3 bucket"
  value       = aws_s3_bucket.website.hosted_zone_id
}

output "website_endpoint" {
  description = "Website endpoint of the S3 bucket"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "website_domain" {
  description = "Website domain of the S3 bucket"
  value       = aws_s3_bucket_website_configuration.website.website_domain
}

output "access_logs_bucket_name" {
  description = "Name of the access logs bucket (if enabled)"
  value       = var.enable_logging ? aws_s3_bucket.access_logs[0].bucket : null
} 