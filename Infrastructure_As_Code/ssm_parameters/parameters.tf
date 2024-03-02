resource "aws_ssm_parameter" "database_password" {
  name = "/production/database/password/master"
  description = "Password for master database, for production environment"
  type = "SecureString"
  value = "thisIsTheDatabasePassword"
  tags = {
	Environment = "production"
  }
}

resource "aws_ssm_parameter" "database_username" {
  name = "/production/database/username/master"
  description = "Username for master database, for production environment"
  type = "String"
  value = "thisIsTheDatabaseUsername"
  tags = {
	Environment = "production"
  }
}
resource "aws_ssm_parameter" "database_url" {
	name = "/production/database/url"
	description = "URL for master database, for production environment"
	type = "String"
}
