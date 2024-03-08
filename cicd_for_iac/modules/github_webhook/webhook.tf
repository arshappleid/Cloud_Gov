resource "aws_codepipeline_webhook" "example" {
  name            = "${var.project_name}-GITHUB-REPO-WEBHOOK"
  authentication  = "GITHUB_HMAC"
  target_action   = "Source"
  target_pipeline = aws_codepipeline.example.name

  authentication_configuration {
    secret_token = var.GITHUB_WEBHOOK_SECRET
  }

  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/${var.CODE_SRC_BRANCH}"
  }
}
