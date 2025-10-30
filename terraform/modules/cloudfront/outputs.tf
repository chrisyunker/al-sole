output "distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.website.id
}

output "distribution_arn" {
  description = "CloudFront distribution ARN"
  value       = aws_cloudfront_distribution.website.arn
}

output "distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.website.domain_name
}

output "distribution_hosted_zone_id" {
  description = "CloudFront distribution hosted zone ID"
  value       = aws_cloudfront_distribution.website.hosted_zone_id
}

output "distribution_status" {
  description = "CloudFront distribution status"
  value       = aws_cloudfront_distribution.website.status
}

output "origin_access_control_id" {
  description = "Origin Access Control ID"
  value       = aws_cloudfront_origin_access_control.website.id
}

output "security_headers_policy_id" {
  description = "Security headers policy ID"
  value       = aws_cloudfront_response_headers_policy.security_headers.id
}

output "logs_bucket_name" {
  description = "Name of the CloudFront logs bucket (if enabled)"
  value       = var.enable_logging ? aws_s3_bucket.cloudfront_logs[0].bucket : null
} 