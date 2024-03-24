#Replication bucket
resource "aws_s3_bucket" "replication_bucket" {
  provider      = aws.replication
  bucket_prefix = "${regex("[a-z0-9.-]+", lower(var.project_name))}-replication-bucket"
}

resource "aws_s3_bucket_ownership_controls" "replication_ownership_rule" {
  bucket = aws_s3_bucket.replication_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "replication_bucket_access" {
  provider                = aws.replication
  bucket                  = aws_s3_bucket.replication_bucket.id
  ignore_public_acls      = true
  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
}



resource "aws_s3_bucket_acl" "replication_bucket_acl" {
  provider = aws.replication
  bucket   = aws_s3_bucket.replication_bucket.id
  acl      = "private"
}

resource "aws_s3_bucket_versioning" "replication_bucket_versioning" {
  provider = aws.replication
  bucket   = aws_s3_bucket.replication_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "replication_bucket_encryption" {
  provider = aws.replication
  bucket   = aws_s3_bucket.replication_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_logging" "replication_bucket_logging" {
  provider      = aws.replication
  bucket        = aws_s3_bucket.replication_bucket.id
  target_bucket = aws_s3_bucket.replication_bucket.id
  target_prefix = "log/"
}
