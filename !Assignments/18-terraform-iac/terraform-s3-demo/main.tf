# S3 bucket names are global across all AWS accounts, so add a random suffix.
resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo" {
  bucket        = "${var.bucket_prefix}-${random_id.suffix.hex}"
  force_destroy = true # lets `terraform destroy` delete the bucket even if it has objects

  tags = {
    Name        = "${var.bucket_prefix}-${random_id.suffix.hex}"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
