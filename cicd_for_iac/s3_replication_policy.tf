data "aws_iam_policy_document" "bucket_policy_doc_replication_bucket" {
  provider = aws.replication
  statement {
    principals {
      type        = "AWS"
      identifiers = [module.iam_roles.codepipeline_role_arn]
    }

    actions = [
      "s3:Get*",
      "s3:List*",
      "s3:ReplicateObject",
      "s3:PutObject",
      "s3:RestoreObject",
      "s3:PutObjectVersionTagging",
      "s3:PutObjectTagging",
      "s3:PutObjectAcl"
    ]

    resources = [
      module.s3_artifacts_bucket.replication_bucket_arn,
      "${module.s3_artifacts_bucket.replication_bucket_arn}/*",
    ]
  }
}
resource "aws_s3_bucket_policy" "bucket_policy_replication_bucket" {
  provider = aws.replication
  bucket   = module.s3_artifacts_bucket.replication_bucket_id
  policy   = data.aws_iam_policy_document.bucket_policy_doc_replication_bucket.json
}


