output "waf_arn" {
  value = aws_wafv2_rule_group.main_waf.arn
}
