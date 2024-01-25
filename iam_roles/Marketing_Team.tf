/*
- Marketing Team OU
--- Marketing Account  - Gets all the billing
--- Marketing Manager OU
------Marketing Manager
--- Marketing TEAM OU
------Marketing Team memeber 1
------Marketing Team memeber 2

*/
resource "aws_organizations_organizational_unit" "marketing_dept" {
  name      = "Marketing Department"
  parent_id = aws_organizations_organization.my_organization.roots[0].id
}

resource "aws_organizations_move_account" "move_marketing_account" {
  account_id   = aws_organizations_account.marketing_account.id
  source_parent_id = aws_organizations_organization.cloud_gov.roots[0].id
  destination_parent_id = aws_organizations_organizational_unit.marketing_dept.id
}

resource "aws_organizations_organizational_unit" "marketing_manager" {
  name      = "Marketing Manager"
  parent_id = aws_organizations_organizational_unit.marketing_dept.id
}

resource "aws_organizations_organizational_unit" "marketing_team" {
  name      = "Marketing Team"
  parent_id = aws_organizations_organizational_unit.marketing_dept.id
}


// Attach Manager policies

resource "aws_organizations_policy_attachment" "marketing_ou_attachment_1" {
  policy_id = aws_organizations_policy.tier2_team_Managers_scp.id
  target_id = aws_organizations_organizational_unit.marketing_manager.id
}

resource "aws_organizations_policy_attachment" "marketing_ou_attachment_2" {
  policy_id = aws_organizations_policy.marketing_team_scp.id
  target_id = aws_organizations_organizational_unit.marketing_manager.id
}

// Attach Team Member policies

resource "aws_organizations_policy_attachment" "marketing_ou_attachment_3" {
  policy_id = aws_organizations_policy.tier3_team_members_scp.id
  target_id = aws_organizations_organizational_unit.marketing_team.id
}

resource "aws_organizations_policy_attachment" "marketing_ou_attachment_4" {
  policy_id = aws_organizations_policy.marketing_team_scp.id
  target_id = aws_organizations_organizational_unit.marketing_team.id
}



