variable "project_name" {
  description = "Unique name for this project"
  type        = string
}
variable "GITHUB_WEBHOOK_SECRET" {
  description = "GitHub OAuth token , for CODEPIPELINE To Access Repo"
  validation {
    condition     = length(var.GITHUB_WEBHOOK_SECRET) > 0
    error_message = "WEBHOOK SECRET is required to pull from repo."
  }
}

variable "CODE_SRC_BRANCH" {
  description = "GITHUB branch name , to trigger the pipeline on , default = main"
  default     = "main"
}

variable "CODEPIPELINE_NAME" {
  description = "Name for CODE PIPELINE To Attach The webhook to"
  validation {
    condition     = length(var.CODEPIPELINE_NAME) > 0
    error_message = "CodePipeline Name to Create the Connection to is required."
  }

}
