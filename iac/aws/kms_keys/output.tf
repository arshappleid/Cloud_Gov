output "log_bucket_kms_key_arn" {
  value = aws_kms_key.logs_encryption_key.arn
}
