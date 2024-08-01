variable "tags" {
  type = map()
}

variable "destination_id"{
  description = "Where to route the requests , that match the cloudfront config"
}
