# Create SNS Topic
resource "aws_sns_topic" "securityhub_alerts" {
  name = "security-hub-alerts"
}

# Subscribe each email to the SNS Topic
resource "aws_sns_topic_subscription" "email_subscriptions_2" {
  count     = length(var.guardduty_alert_emails)
  topic_arn = aws_sns_topic.securityhub_alerts.arn
  protocol  = "email"
  endpoint  = var.guardduty_alert_emails[count.index]
}


# Create an EventBridge rule to trigger on findings
resource "aws_cloudwatch_event_rule" "securityhub_findings" {
  name        = "securityhub-findings-rule"
  description = "Trigger on Security Hub Findings"

  event_pattern = jsonencode({
    source        = ["aws.securityhub"]
    "detail-type" = ["Security Hub Findings - Imported"]
    detail = {
      findings = {
        Severity = {
          Label = ["HIGH", "CRITICAL"]
        }
      }
    }
  })
}

# Create EventBridge Target to SNS
resource "aws_cloudwatch_event_target" "send_to_sns_2" {
  rule = aws_cloudwatch_event_rule.securityhub_findings.name
  arn  = aws_sns_topic.securityhub_alerts.arn

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
