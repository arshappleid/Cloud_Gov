cd cicd_for_iac
terraform plan -var-file="examples/terraform.tfvars"
terraform apply -var-file="examples/terraform.tfvars" --auto-approve

