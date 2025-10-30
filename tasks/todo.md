# Fix CloudFront SSL Certificate Error

## Context
CloudFront distribution creation is failing with error: "The specified SSL certificate doesn't exist, isn't in us-east-1 region, isn't valid, or doesn't include a valid certificate chain."

The issue is that the ACM certificate resources in `terraform/main.tf` don't explicitly specify the `provider = aws.us_east_1` configuration, which is required for CloudFront to use the certificate.

## Root Cause
- ACM certificates for CloudFront **must** be created in the us-east-1 region
- The certificate resources (lines 92-111 in main.tf) don't explicitly use the `aws.us_east_1` provider alias
- Without the explicit provider, Terraform may be creating the cert in the wrong region or CloudFront can't reference it correctly

## Plan

### Changes Required
- [ ] Update `aws_acm_certificate.cert` resource to explicitly use `provider = aws.us_east_1`
- [ ] Update `aws_acm_certificate_validation.cert` resource to explicitly use `provider = aws.us_east_1`
- [ ] Run `terraform plan` to verify the configuration is correct
- [ ] Run `terraform apply` to deploy the fix

---

## Implementation Details

The fix is simple - add `provider = aws.us_east_1` to both certificate resources:

```hcl
resource "aws_acm_certificate" "cert" {
  provider = aws.us_east_1  # Add this line
  ...
}

resource "aws_acm_certificate_validation" "cert" {
  provider = aws.us_east_1  # Add this line
  ...
}
```

This ensures the certificate is explicitly created in us-east-1, which is required by CloudFront for custom SSL certificates.

---

## Review Section

### Summary of Changes

Successfully fixed the CloudFront SSL certificate error by explicitly specifying the us-east-1 provider for ACM certificate resources. The infrastructure is now fully deployed and operational.

### Files Modified

**terraform/main.tf** (lines 92-115):
- Added `provider = aws.us_east_1` to `aws_acm_certificate.cert` resource
- Added `provider = aws.us_east_1` to `aws_acm_certificate_validation.cert` resource

### Deployment Results

- ACM certificate created successfully in us-east-1 region
  - New ARN: `arn:aws:acm:us-east-1:714285204136:certificate/756730bc-068f-43ab-8f3e-9c339835d694`
- CloudFront distribution created: `E1PRN8HJC8QMIS`
- CloudFront domain: Available (visible in outputs)
- DNS records configured in Cloudflare
- Cache invalidation completed successfully
- S3 bucket policy configured for CloudFront access

### Key Improvements

1. **Correct Regional Configuration**: Certificate now explicitly created in us-east-1, which is required by CloudFront
2. **Successful Deployment**: All resources deployed without errors in ~3.5 minutes
3. **Automated DNS Setup**: Cloudflare DNS records automatically configured
4. **Security**: S3 bucket locked down with Origin Access Control (OAC)

### Infrastructure Created

- 7 new resources added
- 1 resource replaced (DNS validation record)
- 0 errors during deployment

The website infrastructure is now fully operational and ready to serve content via CloudFront at `alsole.yunker.dev`.
