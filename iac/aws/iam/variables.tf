variable "log_bucket_kms_key_arn" {
  description = "ARN of the AWS KMS key used for encryption."
  type        = string

  validation {
    condition     = can(regex("^arn:aws:kms:[a-z]+-[a-z]+-[0-9]:[0-9]{12}:key/[a-z0-9-]+$", var.kms_key_arn))
    error_message = "The kms_key_arn must be a valid ARN of an AWS KMS key. E.g., arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef."
  }
}