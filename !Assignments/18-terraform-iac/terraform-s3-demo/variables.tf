variable "aws_region" {
  type        = string
  description = "AWS region where the S3 bucket will be created."
  default     = "ap-south-1"
}

variable "bucket_prefix" {
  type        = string
  description = "Prefix of the bucket name. A random suffix is added because bucket names are globally unique."
  default     = "terraform-s3-demo"
}

variable "environment" {
  type        = string
  description = "Environment tag."
  default     = "dev"
}
