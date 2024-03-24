#This solution, non-production-ready template describes AWS Codepipeline based CICD Pipeline for terraform code deployment.
#© 2023 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
#This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
#http://aws.amazon.com/agreement or other written agreement between Customer and either
#Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

#Artifact Bucket
resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket_prefix = regex("[a-z0-9.-]+", lower(var.project_name))
  tags          = var.tags
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "artifact_ownership_rule" {
  bucket = aws_s3_bucket.codepipeline_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "codepipeline_bucket_access" {
  bucket                  = aws_s3_bucket.codepipeline_bucket.id
  ignore_public_acls      = true
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
}


resource "aws_s3_bucket_acl" "codepipeline_bucket_acl" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "codepipeline_bucket_versioning" {
  bucket = aws_s3_bucket.codepipeline_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "codepipeline_bucket_encryption" {
  bucket = aws_s3_bucket.codepipeline_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_logging" "codepipeline_bucket_logging" {
  bucket        = aws_s3_bucket.codepipeline_bucket.id
  target_bucket = aws_s3_bucket.codepipeline_bucket.id
  target_prefix = "log/"
}



