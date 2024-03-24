data "aws_secretsmanager_secret" "terraform_access_key" {
  name = var.secret_access_key_path
}
data "aws_secretsmanager_secret" "terraform_secret_key" {
  name = var.secret_secret_key_path
}


resource "aws_iam_role_policy" "codebuild_ssm_access_policy" {
  name = "${var.project_name}-codebuild-ssm-access-policy"
  role = var.codebuild_role_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssm:GetParameters",
        ],
        Effect = "Allow",
        Resource = [
          data.aws_secretsmanager_secret.terraform_access_key.arn,
          data.aws_secretsmanager_secret.terraform_secret_key.arn,
        ]
      },
    ]
  })
}
