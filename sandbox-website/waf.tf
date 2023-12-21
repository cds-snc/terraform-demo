
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
