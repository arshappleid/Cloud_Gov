# Create SNS Topic
resource "aws_sns_topic" "guardduty_alerts" {
  name = "guardduty-alerts"
}

# Subscribe each email to the SNS Topic
resource "aws_sns_topic_subscription" "email_subscriptions_1" {
  count     = length(var.guardduty_alert_emails)
  topic_arn = aws_sns_topic.guardduty_alerts.arn
  protocol  = "email"
  endpoint  = var.guardduty_alert_emails[count.index]
}

# Create EventBridge Rule
resource "aws_cloudwatch_event_rule" "guardduty_finding_rule" {
  name        = "guardduty-finding-rule"
  description = "Capture GuardDuty Findings"
  event_pattern = jsonencode({
    "source" : ["aws.guardduty"],
    "detail-type" : ["GuardDuty Finding"]
  })
}

# Create EventBridge Target to SNS
resource "aws_cloudwatch_event_target" "send_to_sns_1" {
  rule = aws_cloudwatch_event_rule.guardduty_finding_rule.name
  arn  = aws_sns_topic.guardduty_alerts.arn

  // Lets transform the message
  input_transformer {
    input_paths = {
      detailType   = "$.detail-type"
      severity     = "$.detail.severity"
      finding      = "$.detail.description"
      region       = "$.region"
      accountId    = "$.account"
      resourceType = "$.detail.resource.resourceType"
    }
    input_template = "{ \"Subject\": \"GuardDuty Alert - <severity>\", \"Message\": \"A finding of type <detailType> was detected: <finding>. Resource Type: <resourceType>. Region: <region>. Account: <accountId>\" }"
  }
}
