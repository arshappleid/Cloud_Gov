resource "aws_s3_bucket_policy" "bucket_policy_codepipeline_bucket" {
  bucket = var.s3_bucket_id
  policy = data.aws_iam_policy_document.bucket_policy_doc_codepipeline_bucket.json
}

data "aws_iam_policy_document" "bucket_policy_doc_codepipeline_bucket" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [aws_iam_role.codepipeline_role.arn]
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
      var.s3_bucket_arn,
      "${var.s3_bucket_arn}/*",
    ]
  }
}
