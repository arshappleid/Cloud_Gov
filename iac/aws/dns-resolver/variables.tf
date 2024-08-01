variable "tags" {
  type = map(string)
}

variable "prod_route_record" {
  description = "DNS name or Public IP of the target Prod Resource"
}

variable "ttl_in_seconds" {
  default     = 172800
  description = "TTL for the DNS record"
}
