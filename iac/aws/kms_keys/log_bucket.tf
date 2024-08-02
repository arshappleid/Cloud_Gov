resource "aws_kms_key" "logs_encryption_key" {
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = var.tags.env == "dev" ? 1 : 7
}
