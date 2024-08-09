variable "project_name" {
  description = ""
  default     = "test-project-delete-later"
}

variable "tags" {
  type = map(string)
}

variable "enable_logging" {
  description = "Enable logging for WAF"
  type        = bool
  default     = false
}
