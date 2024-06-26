variable "env" {
  default     = "dev"
  description = "Description of the CICD ENV we are using"
}
variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription ID"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure tentant ID"
}

variable "azure_client_id" {
  type        = string
  description = "Azure client ID"
}

variable "azure_client_secret" {
  type        = string
  description = "Azure client secret"
}

locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}
