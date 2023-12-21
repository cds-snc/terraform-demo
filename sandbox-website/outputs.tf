output "cognito_outside_canada_metric_name" {
  description = "Forms Builder Login: A metric to track request made outside of Canada."
  value       = one([for x in aws_wafv2_web_acl.forms_acl.rule : one(x.visibility_config.*.metric_name) if x.name == "AWSCognitoLoginOutsideCanada"])
}
