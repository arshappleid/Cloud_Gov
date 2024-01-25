resource "aws_organizations_organizational_unit" "it" {
  name      = "IT"
  parent_id = aws_organizations_organization.cloud_gov.roots[0].id
}

resource "aws_organizations_organizational_unit" "it_manager" {
  name      = "IT_Manager"
  parent_id = aws_organizations_organizational_unit.it.id
}

resource "aws_organizations_organizational_unit" "it_manager" {
  name      = "IT_Team_Members"
  parent_id = aws_organizations_organizational_unit.it.id
}