output "bucket_name" {
  description = "Name of the S3 bucket."
  value       = aws_s3_bucket.iron-water-bucket.bucket
}
output "bucket_arn" {
  description = "ARN of the S3 bucket."
  value       = aws_s3_bucket.iron-water-bucket.arn
}
output "bucket_region" {
  description = "AWS region of the S3 bucket."
  value       = aws_s3_bucket.iron-water-bucket.region
}
