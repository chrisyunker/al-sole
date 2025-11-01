# Al Sole - AWS Deployment Guide

This guide explains how to deploy Al Sole to AWS using Terraform.

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

