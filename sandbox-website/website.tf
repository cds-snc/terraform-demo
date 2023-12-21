module "website" {
  source = "github.com/cds-snc/terraform-modules//simple_static_website"

  domain_name_source = "wmoussa.cdssandbox.xyz"
  billing_tag_value  = "simple-static-website"

  providers = {
    aws           = aws
    aws.dns       = aws # For scenarios where there is a dedicated DNS provder.
    aws.us-east-1 = aws.us-east-1
  }
}

resource "aws_s3_object" "index" {
  bucket = module.website.s3_bucket_id
  key    = "index.html"
  source = "static/index.html"
}
