variable "aws_regions" {
  type = set(string)
}

variable "azure_regions"{
  type = set(string)
}

variable "aws_default_tags" {
  description = "A map of default tags to apply to all AWS/Azure resources"
  type        = map(string)
  default     = {}
}

