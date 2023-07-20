module "log_bucket" {
  source            = "github.com/cds-snc/terraform-modules//S3?ref=v7.0.0"
  bucket_name       = "unique-bucket-name-for-a-remote-state-demo"
  billing_tag_value = "cds-terraform-demo"
}
