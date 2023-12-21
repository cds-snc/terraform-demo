terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

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

resource "aws_wafv2_web_acl" "forms_acl" {
  name  = "GCForms"
  scope = "CLOUDFRONT"

  provider = aws.us-east-1

  default_action {
    allow {}
  }

  rule {
    # make sure to update line 33 of output.tf if you change the name of the rule
    name     = "AWSCognitoLoginOutsideCanada"
    priority = 5

    action {
      count {}
    }

    statement {

      and_statement {
        statement {
          not_statement {
            statement {
              geo_match_statement {
                country_codes = ["CA"]
              }
            }
          }
        }

        statement {
          regex_pattern_set_reference_statement {
            arn = aws_wafv2_regex_pattern_set.cognito_login_paths.arn
            field_to_match {
              uri_path {}
            }
            text_transformation {
              priority = 1
              type     = "COMPRESS_WHITE_SPACE"
            }
            text_transformation {
              priority = 2
              type     = "LOWERCASE"
            }
          }
        }
      }
    }

    visibility_config {
      metric_name                = "AWSCognitoLoginOutsideCanada"
      cloudwatch_metrics_enabled = true
      sampled_requests_enabled   = true
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "forms_global_rule"
    sampled_requests_enabled   = false
  }
}

resource "aws_wafv2_regex_pattern_set" "cognito_login_paths" {
  name        = "cognito_login_paths"
  scope       = "CLOUDFRONT"
  description = "Regex to match the login URIs"

  provider = aws.us-east-1

  regular_expression {
    regex_string = "^\\/(api\\/auth\\/(signin|callback)\\/cognito)$"
  }
}

resource "aws_cloudwatch_metric_alarm" "temporary_token_generated_outside_canada_warn" {
  alarm_name          = "AWSCognitoLoginOutsideCanadaAlarm"
  namespace           = "??"
  metric_name         = "??"
  statistic           = "SampleCount"
  period              = "300"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "0"
  evaluation_periods  = "1"
  treat_missing_data  = "notBreaching"
  provider            = aws.us-east-1

  alarm_description = "Forms Warning: A sign-in by a forms owner has been detected from outside of Canada."
}
