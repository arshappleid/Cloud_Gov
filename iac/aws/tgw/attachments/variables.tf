variable "tgw_id" {
  description = "ID of the Transit Gateway to which VPCs will be attached"
  type        = string
}

variable "attachments" {
  description = <<EOF
  List of objects, each representing a VPC attachment and its route configurations. Each attachment includes:
  - vpc_id: Identifier for the VPC attached to the Transit Gateway.
  - subnet_ids: List of subnet IDs within the VPC; all subnets listed here will be able to reach the Transit Gateway Attachment.
  - destination_cidr: Destination CIDR blocks; traffic destined for these CIDR blocks will be sent to the Transit Gateway Attachment
  This setup enables specific VPC subnets to interact with different destination networks via the Transit Gateway.
EOF
  type = list(object({
    vpc_name                = string
    vpc_id                  = string
    vpc_main_route_table_id = string
    subnet_ids              = list(string)
    destination_cidr        = string
  }))

  validation {
    condition     = length(var.attachments) > 0
    error_message = "At least one attachment must be specified."
  }

  validation {
    condition     = alltrue([for attachment in var.attachments : can(regex("^vpc-", attachment.vpc_id))])
    error_message = "All vpc_id values must start with 'vpc-'."
  }
}
