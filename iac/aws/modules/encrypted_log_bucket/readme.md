# S3 Encrypted Logs Module

This module creates an S3 bucket for logs, encrypted with a shared KMS key.

Actual Bucket name is expected to be different.

## Usage

Example usage:

```hcl
module "s3_encrypted_logs" {
  source        = "../modules/s3-encrypted-logs"
  bucket_name   = "main-cloudfront" 
  kms_key_arn   = "provided_kms_key_arn"
}
```

Will Create the 