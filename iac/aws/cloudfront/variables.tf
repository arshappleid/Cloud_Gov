variable "tags" {
  type = map(string)
}

variable "destination_id" {
  description = "Where to route the requests , that match the cloudfront config"
}
