#This solution, non-production-ready template describes AWS Codepipeline based CICD Pipeline for terraform code deployment.
#© 2023 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
#This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
#http://aws.amazon.com/agreement or other written agreement between Customer and either
#Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_codepipeline" "terraform_pipeline" {

  name     = "${var.project_name}-pipeline"
  role_arn = var.codepipeline_role_arn
  tags     = var.tags

  artifact_store {
    location = var.s3_bucket_name
    type     = "S3"
    encryption_key {
      id   = var.kms_key_arn
      type = "KMS"
    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      version          = "1"
      provider         = "Github"
      namespace        = "SourceVariables"
      output_artifacts = ["SourceOutput"]
      run_order        = 1

      configuration = {
        Owner      = var.CODE_SRC_OWNER_USERNAME
        Repo       = var.CODE_SRC_URL
        BranchName = var.source_repo_branch
        OAuthToken = var.GITHUB_WEBHOOK_SECRET
      }
    }
  }

  dynamic "stage" {
    for_each = var.stages

    content {
      name = "Stage-${stage.value["name"]}"
      action {
        category         = stage.value["category"]
        name             = "Action-${stage.value["name"]}"
        owner            = stage.value["owner"]
        provider         = stage.value["provider"]
        input_artifacts  = ["SourceOutput"]
        output_artifacts = [stage.value["output_artifacts"]]
        version          = "1"
        run_order        = index(var.stages, stage.value) + 2

        configuration = {
          ProjectName = stage.value["provider"] == "CodeBuild" ? "${var.project_name}-${stage.value["name"]}" : null
        }
      }
    }
  }

}
