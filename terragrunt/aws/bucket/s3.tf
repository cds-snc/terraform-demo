# Create an S3 bucket using the CDS Terraform module
module "log_bucket" {
  source            = "github.com/cds-snc/terraform-modules?ref=v0.0.43//S3"
  bucket_name       = "${var.bucket_name}-${var.env}"
  billing_tag_value = var.billing_code
}
