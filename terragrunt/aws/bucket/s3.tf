# Create an S3 bucket using the CDS Terraform module
module "log_bucket" {
  source            = "github.com/cds-snc/terraform-modules//S3?ref=v7.0.0"
  bucket_name       = "${var.bucket_name}-${var.env}"
  billing_tag_value = var.billing_code
}
