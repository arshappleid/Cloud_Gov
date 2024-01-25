resource "aws_iam_role" "tier1_upper_Management" {
  name = "tier1_upper_Management"
  assume_role_policy = file("${path.module}/role_based_policies/tier1_upper_Management.json")
}

resource "aws_iam_role" "tier2_team_Managers" {
  name = "tier2_team_Managers"
  assume_role_policy = file("${path.module}/role_based_policies/tier2_team_Managers.json")
}

resource "aws_iam_role" "tier3_team_Members" {
  name = "tier3_team_Members"
  assume_role_policy = file("${path.module}/role_based_policies/tier3_team_Members.json")
}

resource "aws_iam_role" "development_team" {
  name = "development_team"
  assume_role_policy = file("${path.module}/role_based_policies/development_team.json")
}

resource "aws_iam_role" "IT_Team" {
  name = "IT_Team"
  assume_role_policy = file("${path.module}/role_based_policies/IT_Team.json")
}

resource "aws_iam_role" "data_analysis_team" {
  name = "data_analysis_team"
  assume_role_policy = file("${path.module}/role_based_policies/data_analysis_team.json")
}

resource "aws_iam_role" "marketing_team" {
  name = "marketing_team"
  assume_role_policy = file("${path.module}/role_based_policies/marketing_team.json")
}

resource "aws_iam_role" "admin" {
  name = "admin"
  assume_role_policy = file("${path.module}/role_based_policies/admin.json")
}

