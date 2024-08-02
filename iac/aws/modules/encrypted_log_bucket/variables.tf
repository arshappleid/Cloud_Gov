variable "kms_key_arn" {
  description = "ARN of the AWS KMS key used for encryption."
  type        = string

  validation {
    condition     = can(regex("^arn:aws:kms:[a-z]+-[a-z]+-[0-9]:[0-9]{12}:key/[a-z0-9-]+$", var.kms_key_arn))
    error_message = "The kms_key_arn must be a valid ARN of an AWS KMS key. E.g., arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef."
  }
}
variable "bucket_name" {
  description = "Bucket Name"
}
variable "tags" {
  type        = map(string)
  description = "A map of tags to apply to resources. Must include 'env' and 'project_name'."

  validation {
    condition     = contains(keys(var.tags), "env") && contains(keys(var.tags), "project_name")
    error_message = "The 'tags' map must include the keys 'env' and 'project_name'."
  }
}


variable "versioning" {
  default     = false
  description = "Should the versioning be enabled (true) or not (false)"
}

variable "delete_logs_after_n_days" {
  type        = number
  default     = 420
  description = "After how many days to delete cloudfront logs after"

  validation {
    condition     = var.delete_logs_after_n_days > 1
    error_message = "The number of days must be greater than 1 to ensure proper deletion timing."
  }
}
