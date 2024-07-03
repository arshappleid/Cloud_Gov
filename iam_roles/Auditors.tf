/*
- Auditor's - Only have Read S3 access.

--- Identity Management Auditor -- Read Only Access to Identity Management Logs

--- Application Logs Auditor -- Read Only Access to Application Logs

--- Database Auditor  -- Read Only Access to Database Logs

--- WAF Access Audtior -- Read Only Access to WAF Logs

--- VPC Flow Logs Audtior -- Read Only Access to VPC Flow Logs

*/

resource "aws_organizations_organizational_unit" "auditors" {
  name      = "Auditor's Account"
  parent_id = aws_organizations_organization.my_organization.roots[0].id
}

// Move the Auditors account , under Auditor Organizational unit
resource "aws_organizations_move_account" "move_auditors_account" {
  account_id            = aws_organizations_account.auditors_account.id
  source_parent_id      = aws_organizations_organization.cloud_gov.roots[0].id
  destination_parent_id = aws_organizations_organizational_unit.auditors.id
}

resource "aws_organizations_policy" "read_only_scp" {
  name        = "Read only access to S3 buckets"
  description = "Policy Will grant read only access to all S3 buckets"
  content     = file("${path.module}/service_based_policies/auditors.json")
}

resource "aws_organizations_policy_attachment" "attach_main_policy" {
  policy_id = aws_organizations_policy.read_only_scp.id
  target_id = aws_organizations_organizational_unit.auditors.id
}


