resource "aws_s3_bucket" "the_bucket" {
  bucket = "unique-bucket-name-for-a-local-state-demo"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    "CostCentre" = "cds-terraform-demo"
    "Terraform"  = true
  }
}

resource "aws_s3_bucket_public_access_block" "the_bucket" {
  bucket = aws_s3_bucket.the_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
