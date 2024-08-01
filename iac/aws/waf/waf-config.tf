resource "aws_wafv2_rule_group" "main_waf" {
  capacity = 1000 // How much compute to assign
  name     = "Main Rule Config"
  scope    = "CLOUDFRONT"

  /* Rule 1 - Prevents Access from Outside the US */
  rule {
    name     = "Allow-Access-From-US-Only"
    priority = 1

    action {
      count {}
    }
    statement {
      not_statement {
        statement {
          geo_match_statement {
            country_codes = ["US"]
          }
        }
      }
    }

    dynamic "visibility_config" {
      for_each = var.enable_logging ? [1] : []
      content {
        cloudwatch_metrics_enabled = true
        metric_name                = "${var.project_name}-WAF-Requests-From-Outside-the-US"
        sampled_requests_enabled   = false
      }
    }
  }

  /* Rule 2 - Prevents Cross Site Scripting */
  rule {
    name     = "XSSRule"
    priority = 1
    action {
      block {}
    }
    statement {
      or_statement {
        statement {
          byte_match_statement {
            field_to_match {
              query_string {}
            }
            positional_constraint = "CONTAINS"
            search_string         = "<script"
            text_transformation {
              priority = 0
              type     = "URL_DECODE"
            }
          }
        }
        statement {
          byte_match_statement {
            field_to_match {
              body {}
            }
            positional_constraint = "CONTAINS"
            search_string         = "<script"
            text_transformation {
              priority = 0
              type     = "HTML_ENTITY_DECODE"
            }
          }
        }
      }
    }
    dynamic "visibility_config" {
      for_each = var.enable_logging ? [1] : []
      content {
        cloudwatch_metrics_enabled = true
        metric_name                = "${var.project_name}-WAF-Requests-From-Outside-the-US"
        sampled_requests_enabled   = false
      }
    }
  }


  /* Rule 3 - Prevents SQL Injection Attacks */
  rule {
    name     = "SQLInjectionRule"
    priority = 1
    action {
      block {}
    }
    statement {
      sqli_match_statement {
        field_to_match {
          query_string {}
        }
        text_transformation {
          priority = 0
          type     = "URL_DECODE"
        }
      }
    }
    dynamic "visibility_config" {
      for_each = var.enable_logging ? [1] : []
      content {
        cloudwatch_metrics_enabled = true
        metric_name                = "${var.project_name}-WAF-Requests-From-Outside-the-US"
        sampled_requests_enabled   = false
      }
    }
  }

  /* How to store Default Logs*/
  dynamic "visibility_config" {
    for_each = var.enable_logging ? [1] : []
    content {
      cloudwatch_metrics_enabled = true
      metric_name                = "${var.project_name}-WAF-Requests-From-Outside-the-US"
      sampled_requests_enabled   = false
    }
  }

  tags = merge(var.tags, {
    Purpose = "Main Cloud Front Distribution"
    }
  )
}

