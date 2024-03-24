#This solution, non-production-ready template describes AWS Codepipeline based CICD Pipeline for terraform code deployment.
#© 2023 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
#This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
#http://aws.amazon.com/agreement or other written agreement between Customer and either
#Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

#Module for creating a new S3 bucket for storing pipeline artifacts
module "s3_artifacts_bucket" {
  source       = "./modules/s3"
  project_name = var.project_name
  kms_key_arn  = module.codepipeline_kms.arn
  tags = {
    Project_Name = var.project_name
    Environment  = var.environment
    Account_ID   = local.account_id
    Region       = local.region
  }
}

# Resources

# Module for Infrastructure Source code repository
module "github_webhook" {
  source                = "./modules/github_webhook"
  project_name          = var.project_name
  GITHUB_WEBHOOK_SECRET = "1234"
  CODE_SRC_BRANCH       = "main"
  CODEPIPELINE_NAME     = module.codepipeline_terraform.name
}

# Module for Infrastructure Validation - CodeBuild
module "codebuild_terraform" {
  source                              = "./modules/codebuild"
  CODE_SRC_URL                        = var.CODE_SRC_URL
  project_name                        = var.project_name
  role_arn                            = module.iam_roles.codebuild_role_arn
  codebuild_role_id                   = module.iam_roles.codebuild_role_id
  s3_bucket_name                      = module.s3_artifacts_bucket.bucket
  secret_access_key_path              = var.secret_access_key_path
  secret_secret_key_path              = var.secret_secret_key_path
  build_projects                      = var.build_projects
  builder_compute_type                = var.builder_compute_type
  builder_image                       = var.builder_image
  builder_image_pull_credentials_type = var.builder_image_pull_credentials_type
  builder_type                        = var.builder_type
  kms_key_arn                         = module.codepipeline_kms.arn
  tags = {
    Project_Name = var.project_name
    Environment  = var.environment
    Account_ID   = local.account_id
    Region       = local.region
  }
}

module "codepipeline_kms" {
  source = "./modules/kms"
  tags = {
    Project_Name = var.project_name
    Environment  = var.environment
    Account_ID   = local.account_id
    Region       = local.region
  }

}

module "iam_roles" {

  source                     = "./modules/iam-role"
  project_name               = var.project_name
  codepipeline_iam_role_name = "${var.project_name}-codepipeline-role"
  source_repository_name     = var.source_repo_name
  encryption_key_id          = module.codepipeline_kms.key_id
  kms_key_arn                = module.codepipeline_kms.arn
  s3_bucket_arn              = module.s3_artifacts_bucket.arn
  s3_bucket_id               = module.s3_artifacts_bucket.id
  s3_replication_bucket_id   = module.s3_artifacts_bucket.replication_bucket_id
  s3_replication_bucket_arn  = module.s3_artifacts_bucket.replication_bucket_arn
  tags = {
    Project_Name = var.project_name
    Environment  = var.environment
    Account_ID   = local.account_id
    Region       = local.region
  }
}
# Module for Infrastructure Validate, Plan, Apply and Destroy - CodePipeline
module "codepipeline_terraform" {

  source = "./modules/codepipeline"

  project_name            = var.project_name
  CODE_SRC_URL            = var.CODE_SRC_URL
  GITHUB_WEBHOOK_SECRET   = var.GITHUB_WEBHOOK_SECRET
  CODE_SRC_OWNER_USERNAME = var.CODE_SRC_OWNER_USERNAME
  source_repo_name        = var.source_repo_name
  source_repo_branch      = var.source_repo_branch
  s3_bucket_name          = module.s3_artifacts_bucket.bucket
  codepipeline_role_arn   = module.iam_roles.codepipeline_role_arn
  stages                  = var.stage_input
  kms_key_arn             = module.codepipeline_kms.arn
  tags = {
    Project_Name = var.project_name
    Environment  = var.environment
    Account_ID   = local.account_id
    Region       = local.region
  }
}
