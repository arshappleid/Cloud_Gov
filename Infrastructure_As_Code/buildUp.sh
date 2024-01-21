#! /bin/bash
cd tgw
terraform fmt & terraform apply -auto-approve
cd ../security_vpc
terraform fmt & terraform apply -auto-approve
cd ../frontend_vpc
terraform fmt & terraform apply -auto-approve
cd ..
echo "Finished Building Infrastructure"