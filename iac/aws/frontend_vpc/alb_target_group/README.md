## Module Description

Ideally , we can launch multiple Target Groups in multiple AZ. Just by providing the AZ name , and instance count , type , and AMI image id.

Here AMI ID can also be the point of CICD pipeline , where for different versions of an app , we provide different AMI ID.

Example instance of the module
```terraform
module "target_group_east1a"{
  source = "./alb_target_group"
  // Input variables
  availability_zone = "us-east-1a"
  ASG_instance_AMI_Id = "ami-04c0f9ef2f505b609"
  ASG_instance_type = "t2.micro"
  ASG_desired_capacity = 2
  ASG_max_size = 5
  ASG_min_size = 1
}
```

