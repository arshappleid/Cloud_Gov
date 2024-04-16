resource "github_repository" "Cloud_Gov" {
  name                   = "Cloud_Gov"
  allow_auto_merge       = false
  allow_merge_commit     = false
  allow_rebase_merge     = false
  allow_update_branch    = false
  delete_branch_on_merge = false
  visibility             = "public"

}
