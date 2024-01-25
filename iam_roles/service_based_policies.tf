resource "aws_organizations_policy" "data_analysis_team_scp" {
  name        = "Data Analysis Team"
  description = "SCP for Data Analysis Team"
  content     = file("${path.module}/service_based_policies/data_analysis_team.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy" "development_team_scp" {
  name        = "Development Team"
  description = "SCP for Development Team"
  content     = file("${path.module}/service_based_policies/development_team.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy" "it_team_scp" {
  name        = "IT Team"
  description = "SCP for Development Team"
  content     = file("${path.module}/service_based_policies/IT_team.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy" "marketing_team_scp" {
  name        = "Marketing Team"
  description = "SCP for Development Team"
  content     = file("${path.module}/service_based_policies/marketing_team.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy" "tier1_upper_management_scp" {
  name        = "Tier 1 Upper Management"
  description = "SCP for Development Team"
  content     = file("${path.module}/service_based_policies/tier1_upper_Management.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy" "tier2_team_Managers_scp" {
  name        = "Tier 2 Team Managers"
  description = "SCP for Development Team"
  content     = file("${path.module}/service_based_policies/tier2_team_Managers.json")
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy" "tier3_team_members_scp" {
  name        = "Tier 3 Team Members"
  description = "SCP for Development Team"
  content     = file("${path.module}/service_based_policies/tier3_team_Members.json")
  type        = "SERVICE_CONTROL_POLICY"
}