// Create OU
resource "aws_organizations_organizational_unit" "aws_iam_access_auditor" {
  name      = "IAM Access Audtior"
  parent_id = aws_organizations_organizational_unit.auditors.id
}
// Create the Policy
resource "aws_organizations_policy" "read_only_iam" {
  name        = "Read only access to S3 buckets"
  description = "Policy Will grant read only access to all S3 buckets"
  content     = file("${path.module}/service_based_policies/auditors/iam_auditor.json")
}
// Attach the policy
resource "aws_organizations_policy_attachment" "attach_waf_auditor_policy" {
  policy_id = aws_organizations_policy.read_only_waf.id
  target_id = aws_organizations_organizational_unit.auditors.id
}
