module "s3_bucket_cloudfront_logs" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.tags.project_name}-${var.tags.env}-Cloudfront-Distribution-Logs"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "BucketOwnerEnforced"


  versioning = {
    enabled = false
  }
  force_destroy = contains(["dev"], var.tags.env) // If dev , allow delete

  tags = merge(var.tags, {
    purpose = "Store Cloudfront logs"
  })


  // Delete the logs after 90 days
  lifecycle_rule = [
    {
      id      = "log"
      enabled = true
      prefix  = "${var.tags.project_name}-${var.tags.env}-Cloudfront-Logs"

      tags = {
        rule      = "log"
        autoclean = "true"
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
          }, {
          days          = 60
          storage_class = "GLACIER"
        }
      ]

      expiration = {
        days = var.delete_logs_after_n_days
      }

      noncurrent_version_expiration = {
        days = 30
      }
    }
  ]

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.kms_key_role.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  object_lock_configuration = {
    object_lock_enabled = "Enabled"
    rule = {
      default_retention = {
        mode = "COMPLIANCE"
        days = 1
      }
    }
  }

}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.kms_key_role.arn]
    }

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${module.s3_bucket_cloudfront_logs.s3_bucket_arn}",
    ]
  }
}
