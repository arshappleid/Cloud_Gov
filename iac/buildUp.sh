#! /bin/bash
cd aws
cd tgw
terraform fmt & terraform init & terraform apply -auto-approve
cd ../security_vpc
terraform fmt & terraform init & terraform apply -auto-approve
cd ../frontend_vpc
terraform fmt & terraform init & terraform apply -auto-approve
cd ..
echo "Finished Building Infrastructure"