/*
- IT Team OU
--- IT Account  - Gets all the billing
--- IT Manager OU
------IT Manager
--- IT TEAM OU
------IT Team memeber 1
------IT Team memeber 2

*/
resource "aws_organizations_organizational_unit" "it_dept" {
  name      = "IT Department"
  parent_id = aws_organizations_organization.my_organization.roots[0].id
}

resource "aws_organizations_move_account" "move_it_account" {
  account_id   = aws_organizations_account.it_account.id
  source_parent_id = aws_organizations_organization.cloud_gov.roots[0].id
  destination_parent_id = aws_organizations_organizational_unit.it_dept.id
}

resource "aws_organizations_organizational_unit" "it_manager" {
  name      = "IT Manager"
  parent_id = aws_organizations_organizational_unit.it_dept.id
}

resource "aws_organizations_organizational_unit" "it_team" {
  name      = "IT Team"
  parent_id = aws_organizations_organizational_unit.it_dept.id
}


// Attach Manager policies

resource "aws_organizations_policy_attachment" "it_ou_attachment_1" {
  policy_id = aws_organizations_policy.tier2_team_Managers_scp.id
  target_id = aws_organizations_organizational_unit.it_manager.id
}

resource "aws_organizations_policy_attachment" "it_ou_attachment_2" {
  policy_id = aws_organizations_policy.it_team_scp.id
  target_id = aws_organizations_organizational_unit.it_manager.id
}

// Attach Team Member policies

resource "aws_organizations_policy_attachment" "it_ou_attachment_3" {
  policy_id = aws_organizations_policy.tier3_team_members_scp.id
  target_id = aws_organizations_organizational_unit.it_team.id
}

resource "aws_organizations_policy_attachment" "it_ou_attachment_4" {
  policy_id = aws_organizations_policy.it_team_scp.id
  target_id = aws_organizations_organizational_unit.it_team.id
}



