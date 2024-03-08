#This solution, non-production-ready template describes AWS Codepipeline based CICD Pipeline for terraform code deployment.
#© 2023 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
#This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
#http://aws.amazon.com/agreement or other written agreement between Customer and either
#Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
variable "CODE_SRC_URL" {
  description = "URL for Where the IAC is Stored"
  validation {
    condition     = length(var.CODE_SRC_URL) > 0
    error_message = "CODE_SRC_URL is required for CODE_COMMIT to pull SRC URL"
  }
}
variable "GITHUB_WEBHOOK_SECRET" {
  description = "GitHub OAuth token , for CODEPIPELINE To Access Repo"
  validation {
    condition     = length(var.GITHUB_WEBHOOK_SECRET) > 0
    error_message = "WEBHOOK SECRET is required to pull from repo."
  }
}
variable "CODE_SRC_OWNER_USERNAME" {
  description = "Username of the owner of the Github Repo"
  validation {
    condition     = length(var.CODE_SRC_OWNER_USERNAME) > 0
    error_message = "CODE_SRC_OWNER_USERNAME is required for CODE_Pipeline to pull SRC Code from"
  }
}
variable "project_name" {
  description = "Unique name for this project"
  type        = string
}

variable "source_repo_name" {
  description = "Source repo name of the CodeCommit repository"
  type        = string
}

variable "source_repo_branch" {
  description = "Default branch in the Source repo for which CodePipeline needs to be configured"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name to be used for storing the artifacts"
  type        = string
}

variable "codepipeline_role_arn" {
  description = "ARN of the codepipeline IAM role"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "tags" {
  description = "Tags to be attached to the CodePipeline"
  type        = map(any)
}

variable "stages" {
  description = "List of Map containing information about the stages of the CodePipeline"
  type        = list(map(any))
}
