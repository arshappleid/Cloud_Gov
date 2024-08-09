variable "guardduty_alert_emails" {
  type        = list(string)
  default     = ["notify_this_email@gmail.com"]
  description = "List of emails to notify , about guard duty alerts."
}

variable "securityhub_alert_emails" {
  type        = list(string)
  default     = ["notify_this_email@gmail.com"]
  description = "List of emails to notify , about security hub alerts."
}
