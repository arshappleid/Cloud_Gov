resource "aws_cloudfront_distribution" "s3_distribution" {

  origin {
    domain_name = var.output_endpoint
    origin_id   = var.output_endpoint_resource_id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_ssl_protocols   = "TLSv1.2"
      origin_protocol_policy = "https-only"
    }
  }

  enabled             = true // Should it accept user requests
  is_ipv6_enabled     = false
  comment             = "${var.tags.project_name}-${var.tags.env}-Cloudfront-Distribution"
  default_root_object = "index.html" // File Returned at root url

  logging_config {
    include_cookies = false
    bucket          = var.logging_bucket_regional_name
    prefix          = "${var.tags.project_name}-${var.tags.env}-Cloudfront-Logs"
  }


  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.output_endpoint

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  # Cache behavior with precedence 0
  ordered_cache_behavior {
    path_pattern     = "/content/immutable/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = var.output_endpoint

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  # Cache behavior with precedence 1
  ordered_cache_behavior {
    path_pattern     = "/content/*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.output_endpoint

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US"]
    }
  }

  tags = merge(var.tags, {
    Purpose = "Main Cloud Front Distribution"
    }
  )

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
