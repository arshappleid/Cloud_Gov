#! /bin/bash
cd frontend_vpc
terraform fmt & terraform destroy -auto-approve
cd ../security_vpc
terraform fmt & terraform destroy -auto-approve
cd ../tgw
terraform fmt & terraform destroy -auto-approve
cd ..
echo "Finished Taking Down Infrastructure"