module "cloudfront_logs" {
  source      = "./modules/encrypted_log_bucket"
  kms_key_arn = module.kms_keys.log_bucket_kms_key_arn
  bucket_name = "Cloudfront"

  tags = local.tags
}

