variable "tags" {
  type = map(string)
}

variable "destination_id" {
  description = "Where to route the requests , that match the cloudfront config"
}

variable "delete_logs_after_n_days" {
  default     = 420
  description = "After how many days to delete cloudfront logs after"
}

variable "logging_bucket_regional_name" {
  default = "Regional Bucket Name of the bucket to log the logs in."
}

variable "output_endpoint" {
  description = "Endpoint address to where to route the cloudfront requests too, typically this would the DNS name of the recieving NLB."

  validation {
    condition     = length(output_endpoint) > 1
    error_message = "output endpoint cannot be null, as cloudfront would not know where to route requests too."
  }
}

variable "output_endpoint_resource_id" {
  description = "Endpoint id to where to route the cloudfront requests too, typically this would the resource ID of the NLB."

  validation {
    condition     = length(output_endpoint) > 1
    error_message = "output endpoint cannot be null, as cloudfront would not know where to route requests too."
  }
}
