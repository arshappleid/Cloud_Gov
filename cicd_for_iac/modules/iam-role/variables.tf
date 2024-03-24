#This solution, non-production-ready template describes AWS Codepipeline based CICD Pipeline for terraform code deployment.
#© 2023 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
#This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
#http://aws.amazon.com/agreement or other written agreement between Customer and either
#Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

variable "source_repository_name" {
  type        = string
  description = "Name of the Source CodeCommit repository"
}

variable "project_name" {
  description = "Unique name for this project"
  type        = string
}

variable "codepipeline_iam_role_name" {
  description = "Name of the IAM role to be used by the project"
  type        = string
}

variable "tags" {
  description = "Tags to be attached to the IAM Role"
  type        = map(any)
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket"
  type        = string
}

variable "encryption_key_id" {
  description = "ID of the Encryption key , to attach KMS role"
}

variable "s3_bucket_id" {
  description = "ID of the S3 bucket for Code Pipeline"
}

variable "s3_replication_bucket_id" {
  description = "ID of the replication bucket"
}

variable "s3_replication_bucket_arn" {
  description = "ARN of the replication bucket"
}
