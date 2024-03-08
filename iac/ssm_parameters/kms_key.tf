resource "aws_kms_key" "database_info_key" {
  description              = "KMS key for database info"
  customer_master_key_spec = "RSA_2048" // Assymetric key
  key_usage                = "ENCRYPT_DECRYPT"
  deletion_window_in_days  = 30 // if accidentally deleted, till how long to configure is
}
// Create Administration Policy
resource "aws_kms_key_policy" "database_key_admin_policy" {
  key_id = aws_kms_key.database_info_key.id
  policy = file("${path.module}/policies/key_admin_policy.json")
}
// Attach the Above policy to anyone , who you want to give admin acces for the key

// Create Key Usage Policy - For EC2 Instances
resource "aws_kms_key_policy" "database_key_usage_policy" {
  key_id = aws_kms_key.database_info_key.id
  policy = file("${path.module}/policies/key_usage_policy.json")
}