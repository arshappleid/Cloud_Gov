variable "tgw_id" {
  description = "TGW ID , to attach the routes to"
}

variable "routes" {
  type = list(object({
    cidr_block     = string
    destination_id = string
  }))

  validation {
    condition     = alltrue([for route in var.routes : can(regex("^[0-9]{1,3}(\\.[0-9]{1,3}){3}/[0-9]{1,2}$", route.cidr_block))])
    error_message = "Each cidr_block must be a valid CIDR notation."
  }

  validation {
    condition     = alltrue([for route in var.routes : route.cidr_block != null && route.destination_id != null])
    error_message = "Each route must include a cidr_block and a destination_id."
  }
}
