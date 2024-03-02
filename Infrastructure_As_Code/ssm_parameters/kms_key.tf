resource "aws_kms_key" "database_info_key" {
  description = "KMS key for database info"
  customer_master_key_spec = "RSA_2048"
  key_usage = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 30 // if accidentally deleted, till how long to configure it
}