resource "aws_route53_zone" "main_record" {
  name    = "my_new_domain_name.com"
  comment = "${var.tags.project_name}'s domain name record"
  // no hosted 
  force_destroy = true

  tags = merge(var.tags, {
    Purpose = "Main Record"
  })
}


resource "aws_route53_record" "prod_a_record" {
  zone_id         = aws_route53_zone.main_record.zone_id
  allow_overwrite = true
  name            = "prod.${aws_route53_zone.main-record.name}"
  type            = "A"
  ttl             = var.ttl_in_seconds
  records         = [var.prod_route_record]

  geolocation_routing_policy {
    country = "US"
  }
}





