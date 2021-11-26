module "log_bucket" {
  source            = "github.com/cds-snc/terraform-modules?ref=v0.0.43//S3"
  bucket_name       = "unique-bucket-name-for-a-remote-state-demo"
  billing_tag_value = "cds-terraform-demo"
}
