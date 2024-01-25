/*
- Developer Team OU
--- Developer Account  - Gets all the billing
--- Developer Manager OU
------Developer Manager
--- Developer TEAM OU
------Developer Team memeber 1
------Developer Team memeber 2

*/
resource "aws_organizations_organizational_unit" "developer_dept" {
  name      = "Developer Department"
  parent_id = aws_organizations_organization.my_organization.roots[0].id
}

resource "aws_organizations_move_account" "move_developer_account" {
  account_id   = aws_organizations_account.developer_account.id
  source_parent_id = aws_organizations_organization.cloud_gov.roots[0].id
  destination_parent_id = aws_organizations_organizational_unit.developer_dept.id
}

resource "aws_organizations_organizational_unit" "developer_manager" {
  name      = "Developer Manager"
  parent_id = aws_organizations_organizational_unit.developer_dept.id
}

resource "aws_organizations_organizational_unit" "developer_team" {
  name      = "Developer Team"
  parent_id = aws_organizations_organizational_unit.developer_dept.id
}


// Attach Manager policies

resource "aws_organizations_policy_attachment" "developer_ou_attachment_1" {
  policy_id = aws_organizations_policy.tier2_team_Managers_scp.id
  target_id = aws_organizations_organizational_unit.developer_manager.id
}

resource "aws_organizations_policy_attachment" "developer_ou_attachment_2" {
  policy_id = aws_organizations_policy.developer_team_scp.id
  target_id = aws_organizations_organizational_unit.developer_manager.id
}

// Attach Team Member policies

resource "aws_organizations_policy_attachment" "developer_ou_attachment_3" {
  policy_id = aws_organizations_policy.tier3_team_members_scp.id
  target_id = aws_organizations_organizational_unit.developer_team.id
}

resource "aws_organizations_policy_attachment" "developer_ou_attachment_4" {
  policy_id = aws_organizations_policy.developer_team_scp.id
  target_id = aws_organizations_organizational_unit.developer_team.id
}



