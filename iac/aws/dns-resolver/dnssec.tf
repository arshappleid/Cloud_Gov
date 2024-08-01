# resource "aws_route53_hosted_zone_dnssec" "main_record" {
#   key_management_service_arn = "ARN of the cryptographic key"
#   hosted_zone_id = aws_route53_key_signing_key.main_record.hosted_zone_id
# }
