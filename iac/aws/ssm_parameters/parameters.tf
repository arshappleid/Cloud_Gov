resource "aws_ssm_parameter" "database_password" {
  name        = "/production/database/password/master"
  description = "Password for master database, for production environment"
  type        = "SecureString"
  value       = "thisIsTheDatabasePassword"
  key_id      = aws_kms_key.database_info_key.id
  tags = {
    Environment = "production"
  }
}

resource "aws_ssm_parameter" "database_username" {
  name        = "/production/database/username/master"
  description = "Username for master database, for production environment"
  type        = "String"
  value       = "thisIsTheDatabaseUsername"
  key_id      = aws_kms_key.database_info_key.id
  tags = {
    Environment = "production"
  }
}
resource "aws_ssm_parameter" "database_url" {
  name        = "/production/database/url"
  description = "URL for master database, for production environment"
  value       = "thisIsTheDatabaseURL"
  type        = "String"
  tags = {
    Environment = "production"
  }
}
