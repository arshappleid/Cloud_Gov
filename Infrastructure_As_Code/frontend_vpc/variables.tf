variable "ALB_AZ1" {
  type        = string
  default     = "us-east-1a"
  description = "1 of the 2 AZ in which the ALB will be deployed."
}

variable "ALB_AZ2" {
  type        = string
  default     = "us-east-1b"
  description = "1 of the 2 AZ in which the ALB will be deployed."
}