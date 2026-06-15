output "s3_bucket_name" {
  description = "Frontend S3 bucket name"
  value       = aws_s3_bucket.frontend.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID for cache invalidation"
  value       = aws_cloudfront_distribution.frontend.id
}

output "cloudfront_domain_name" {
  description = "CloudFront domain for accessing the frontend"
  value       = aws_cloudfront_distribution.frontend.domain_name
}

output "github_actions_role_arn" {
  description = "IAM role ARN for GitHub Actions OIDC"
  value       = aws_iam_role.github_actions.arn
}

output "ec2_public_ip" {
  description = "Backend EC2 public IP (empty if ec2_key_name not set)"
  value       = var.ec2_key_name != "" ? aws_instance.backend[0].public_ip : null
}
