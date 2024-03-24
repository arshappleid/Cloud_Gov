#This solution, non-production-ready template describes AWS Codepipeline based CICD Pipeline for terraform code deployment.
#© 2023 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
#This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
#http://aws.amazon.com/agreement or other written agreement between Customer and either
#Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

output "codepipeline_role_arn" {
  value       = aws_iam_role.codepipeline_role.arn
  description = "The ARN of the IAM Role"
}

output "codepipeline_role_name" {
  value       = aws_iam_role.codepipeline_role.name
  description = "The ARN of the IAM Role"
}

output "codebuild_role_arn" {
  value       = aws_iam_role.codebuild_ssm_access.arn
  description = "The ARN of the CodeBuild IAM Role"
}

output "codebuild_role_name" {
  value       = aws_iam_role.codebuild_ssm_access.name
  description = "The ARN of the CodeBuild IAM Role"
}
output "codebuild_role_id" {
  value       = aws_iam_role.codebuild_ssm_access.id
  description = "The ID of the CodeBuild IAM Role"
}


