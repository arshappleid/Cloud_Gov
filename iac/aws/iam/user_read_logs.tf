resource "aws_iam_role" "read_logs_role" {
  name = "Read-Logs"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = "*" // Any IAM role should be able to assume this role
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "log_access_policy" {
  name = "Read-Logs-Policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ],
        Resource = [
          "arn:aws:s3:::logs-*",
          "arn:aws:s3:::logs-*/*"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "kms:Decrypt"
        ],
        Resource = [
          var.log_bucket_kms_key_arn
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "log_access_policy_attachment" {
  role       = aws_iam_role.read_logs_role.name
  policy_arn = aws_iam_policy.log_access_policy.arn
}
