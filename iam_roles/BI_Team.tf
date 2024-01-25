/*
- BI Team OU
--- BI Account  - Gets all the billing
--- BI Manager OU
------BI Manager
--- BI TEAM OU
------BI Team memeber 1
------BI Team memeber 2

*/
resource "aws_organizations_organizational_unit" "bi_dept" {
  name      = "BI Department"
  parent_id = aws_organizations_organization.my_organization.roots[0].id
}

resource "aws_organizations_move_account" "move_bi_account" {
  account_id   = aws_organizations_account.bi_account.id
  source_parent_id = aws_organizations_organization.cloud_gov.roots[0].id
  destination_parent_id = aws_organizations_organizational_unit.bi_dept.id
}

resource "aws_organizations_organizational_unit" "bi_manager" {
  name      = "BI Manager"
  parent_id = aws_organizations_organizational_unit.bi_dept.id
}

resource "aws_organizations_organizational_unit" "bi_team" {
  name      = "BI Team"
  parent_id = aws_organizations_organizational_unit.bi_dept.id
}


// Attach Manager policies

resource "aws_organizations_policy_attachment" "bi_ou_attachment_1" {
  policy_id = aws_organizations_policy.tier2_team_Managers_scp.id
  target_id = aws_organizations_organizational_unit.bi_manager.id
}

resource "aws_organizations_policy_attachment" "bi_ou_attachment_2" {
  policy_id = aws_organizations_policy.bi_team_scp.id
  target_id = aws_organizations_organizational_unit.bi_manager.id
}

// Attach Team Member policies

resource "aws_organizations_policy_attachment" "bi_ou_attachment_3" {
  policy_id = aws_organizations_policy.tier3_team_members_scp.id
  target_id = aws_organizations_organizational_unit.bi_team.id
}

resource "aws_organizations_policy_attachment" "bi_ou_attachment_4" {
  policy_id = aws_organizations_policy.bi_team_scp.id
  target_id = aws_organizations_organizational_unit.bi_team.id
}



