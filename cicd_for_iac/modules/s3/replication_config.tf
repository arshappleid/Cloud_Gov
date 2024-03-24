resource "aws_s3_bucket_replication_configuration" "replication_config" {
  #provider = aws.replication
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.codepipeline_bucket_versioning]

  role   = aws_iam_role.replication_s3_role.arn
  bucket = aws_s3_bucket.codepipeline_bucket.id

  rule {
    id = "${var.project_name}-replication-rule"

    filter {}

    delete_marker_replication {
      status = "Enabled"
    }

    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.replication_bucket.arn
      storage_class = "STANDARD"
    }
  }
}