
module "vpc_flow_logs_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"
  bucket = "vpc-flow-logs"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"

  versioning = {
    enabled = false // Do we really need versions for VPC flow logs ??
  }
  force_destroy = var.env == "prod" ? false : true // Manage This as per Organization Requirements

  lifecycle_rule = [
    {
      id      = "log"
      enabled = true
      prefix  = "log/"

      tags = {
        rule      = "log"
        autoclean = "true"
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA" // After 30 Days transfer to ONEZONE_IA
          }, {
          days          = 60
          storage_class = "GLACIER" // After 60 Days transfer to Glacier
        }
      ]

      expiration = {
        days = 90
      }

      noncurrent_version_expiration = {
        days = 30
      }
    }
  ]
  // Encryption
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = locals.kms_key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  // Object Lock
  object_lock_configuration = {
    object_lock_enabled = "Enabled"
    rule = {
      default_retention = {
        mode = "COMPLIANCE"
        days = 30
      }
    }
  }

}
