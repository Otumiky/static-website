output "bucket_name" {
  value = aws_s3_bucket.wb.bucket
}
output "bucket_id" {
  description = "The ID of the S3 bucket."
  value       = aws_s3_bucket.wb.id
}
output "website_endpoint" {
  description = "The S3 website endpoint"
  value       = aws_s3_bucket_website_configuration.wb.website_endpoint
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket."
  value       = aws_s3_bucket.wb.arn
}

output "regional_domain_name" {
  description = "The regional domain name of the bucket."
  value       = aws_s3_bucket.wb.bucket_regional_domain_name
}