# Al Sole - AWS Deployment Guide

This guide explains how to deploy Al Sole to AWS using Terraform, CloudFront, and S3.

## Architecture

```
User Request
    ↓
Route53 (alsole.yunker.dev DNS)
    ↓
CloudFront Distribution (CDN + HTTPS)
    ↓ (Origin Access Control)
S3 Bucket (private, static hosting)
    └── index.html
```

## Prerequisites

Before deploying, ensure you have:

1. **AWS Account** with appropriate IAM permissions
2. **AWS CLI** configured with credentials (`aws configure`)
3. **Terraform** v1.0+ installed
4. **Existing Route53 hosted zone** for `yunker.dev`

## Initial Setup

### 1. Configure Terraform Variables

Copy the example variables file and customize:

```bash
cd terraform
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your values. The defaults should work for most cases:

```hcl
aws_region       = "us-east-1"
environment      = "production"
project_name     = "al-sole"
domain_name      = "alsole.yunker.dev"
root_domain      = "yunker.dev"
s3_bucket_name   = "al-sole-static-site"  # Must be globally unique
```

**Note**: S3 bucket names must be globally unique across all AWS accounts. If `al-sole-static-site` is taken, choose a different name.

### 2. Initialize Terraform

Initialize Terraform to download providers:

```bash
cd terraform
terraform init
```

### 3. Plan the Infrastructure

Review what Terraform will create:

```bash
terraform plan
```

This will show:
- S3 bucket for hosting
- CloudFront distribution with OAC
- ACM certificate for SSL/TLS
- Route53 DNS records
- Security headers policy

### 4. Create the Infrastructure

Apply the Terraform configuration:

```bash
terraform apply
```

Review the plan and type `yes` to confirm.

**Expected duration**: 20-30 minutes (mostly waiting for CloudFront distribution and certificate validation)

### 5. Verify Infrastructure

After successful apply, Terraform will output:

```
website_url                = "https://alsole.yunker.dev"
cloudfront_distribution_id = "E1234567890ABC"
s3_bucket_name            = "al-sole-static-site"
```

## Deploying Updates

After the initial infrastructure setup, deploy updates using Terraform:

```bash
cd terraform
terraform apply
```

This will automatically:
1. Upload updated `index.html` to S3
2. Invalidate CloudFront cache to ensure fresh content
3. Display deployment status

**Note**: CloudFront cache invalidation may take 2-5 minutes to propagate globally.

### What Terraform Does During Apply

When you run `terraform apply`, Terraform will:
- Detect changes to the website files
- Upload modified files to S3 with proper content types and cache headers
- Trigger CloudFront cache invalidation if files have changed
- Show you the planned changes before applying (review and type `yes` to confirm)

### Manual S3 Upload (Alternative)

If you prefer to upload files manually without running a full Terraform apply:

```bash
# Get S3 bucket name from Terraform
cd terraform
S3_BUCKET=$(terraform output -raw s3_bucket_name)
DISTRIBUTION_ID=$(terraform output -raw cloudfront_distribution_id)

# Upload to S3
aws s3 cp ../website/index.html "s3://${S3_BUCKET}/index.html" \
    --content-type "text/html" \
    --cache-control "max-age=300"

# Invalidate CloudFront cache
aws cloudfront create-invalidation \
    --distribution-id "${DISTRIBUTION_ID}" \
    --paths "/*"
```

## Terraform Commands Reference

### View Current State

```bash
cd terraform
terraform show
```

### View Outputs

```bash
cd terraform
terraform output
```

### Update Infrastructure

If you modify Terraform files:

```bash
cd terraform
terraform plan   # Review changes
terraform apply  # Apply changes
```

### Destroy Infrastructure

To completely remove all AWS resources:

```bash
cd terraform
terraform destroy
```

**Warning**: This will delete the S3 bucket, CloudFront distribution, certificate, and DNS records. The website will become inaccessible.

## Troubleshooting

### Certificate Validation Pending

If `terraform apply` hangs on certificate validation:

1. Check Route53 for DNS validation records
2. Ensure the yunker.dev hosted zone is accessible
3. Wait 5-10 minutes for DNS propagation

### S3 Bucket Name Already Exists

If you get "bucket already exists" error:

1. Choose a different bucket name in `terraform.tfvars`
2. S3 bucket names must be globally unique across all AWS accounts

### CloudFront Not Serving Latest Content

If updates aren't visible:

1. Wait for cache invalidation to complete (2-5 minutes)
2. Check invalidation status:
   ```bash
   aws cloudfront list-invalidations --distribution-id DISTRIBUTION_ID
   ```
3. Clear your browser cache or test in incognito mode

### 403 Forbidden Error

If CloudFront returns 403:

1. Ensure S3 bucket policy allows CloudFront OAC
2. Verify `index.html` exists in S3 bucket
3. Check CloudFront origin settings

### DNS Not Resolving

If `alsole.yunker.dev` doesn't resolve:

1. Check Route53 records were created:
   ```bash
   aws route53 list-resource-record-sets --hosted-zone-id ZONE_ID
   ```
2. Wait for DNS propagation (up to 48 hours, usually much faster)
3. Test with `dig alsole.yunker.dev` or `nslookup alsole.yunker.dev`

## Cost Estimate

Monthly costs (approximate):

- **S3**: ~$0.01/month (minimal storage for single 23KB file)
- **CloudFront**: Free tier includes 50GB data transfer and 2M requests
- **Route53**: $0.50/month per hosted zone (shared with yunker.dev)
- **Certificate**: Free (ACM certificates are free)

**Total estimated cost**: $0-2/month

## Security

- **S3 Bucket**: Private, no public access
- **CloudFront OAC**: Secure access to S3 (replaces deprecated OAI)
- **HTTPS Only**: All HTTP requests redirect to HTTPS
- **TLS 1.2+**: Modern encryption standards
- **Security Headers**: HSTS, X-Frame-Options, CSP, etc.

## Monitoring

### CloudFront Metrics

View in AWS Console:
- CloudFront → Distributions → select distribution → Monitoring
- Metrics: requests, bytes downloaded, error rates

### S3 Metrics

View in AWS Console:
- S3 → Buckets → select bucket → Metrics
- Track storage size and request counts

### Cost Tracking

View in AWS Console:
- Billing → Cost Explorer
- Filter by service (CloudFront, S3, Route53)

## Next Steps

After successful deployment:

1. Test the site at https://alsole.yunker.dev
2. Verify geolocation works (requires HTTPS)
3. Test on mobile devices
4. Monitor CloudFront metrics
5. Set up CloudWatch alarms (optional)

## Support

For Terraform issues, see: https://www.terraform.io/docs

For AWS service issues, see:
- S3: https://docs.aws.amazon.com/s3/
- CloudFront: https://docs.aws.amazon.com/cloudfront/
- Route53: https://docs.aws.amazon.com/route53/
