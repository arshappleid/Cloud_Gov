resource "aws_organizations_organization" "cloud_gov" {
  feature_set = "ALL"
}

resource "aws_organizations_account" "marketing_account" {
  name  = "marketing"
  email = "marketing@example.com"  # Use a unique email address
}

resource "aws_organizations_account" "developer_account" {
  name  = "developer_department"
  email = "marketing@example.com"  # Use a unique email address
}

resource "aws_organizations_account" "it_account" {
  name  = "it_department"
  email = "itg@example.com"  # Use a unique email address
}




