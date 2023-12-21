
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
