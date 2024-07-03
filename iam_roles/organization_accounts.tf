resource "aws_organizations_organization" "cloud_gov" {
  feature_set = "ALL"
}
resource "aws_organizations_policy_attachment" "tier1_scp_attachment_1" {
  policy_id = aws_organizations_policy.tier1_upper_management_scp.id
  target_id = aws_organizations_organization.cloud_gov.id
}
// Rest of the accounts

resource "aws_organizations_account" "marketing_account" {
  name  = "Marketing Department"
  email = "marketing@example.com" # Use a unique email address
}
resource "aws_organizations_account" "bi_account" {
  name  = "BI Department"
  email = "marketing@example.com" # Use a unique email address
}

resource "aws_organizations_account" "developer_account" {
  name  = "Developer department"
  email = "marketing@example.com" # Use a unique email address
}

resource "aws_organizations_account" "it_account" {
  name  = "IT department"
  email = "itg@example.com" # Use a unique email address
}

resource "aws_organizations_account" "auditors_account" {
  name  = "Auditor's Account"
  email = "itg@example.com" # Use a unique email address
}




