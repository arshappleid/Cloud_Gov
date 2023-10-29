provider "aws" {
  region = "us-east-1"
}
// 1. Create the VPC  , CIDR block = 10.0.0.0/16
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my_vpc"
  }
}
// 2. Internet Gateway to allow internet access to the VPC
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}
// 3. A public Subnet for the ALB to be acessed from that region.
resource "aws_subnet" "my_subnet_us_east_1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
}
 
resource "aws_subnet" "my_subnet_us_east_2" {
  provider = aws.us_east_2
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
}

// A load balancer to distribute traffic across the EC2 instances
resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = true // true , so that cannot be accessed from the internet.
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_alb_sg.id]
  subnets            = [aws_subnet.my_subnet_us_east_1.id, aws_subnet.my_subnet_us_east_2.id]

  enable_deletion_protection = false

  tags = {
    Name = "my-alb"
  }
}

resource "aws_security_group" "my_alb_sg" {
  name        = "my_alb_sg"
  description = "Allow Traffic from only from CloudFront"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 80		// Allow HTTP traffic from CloudFront
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = data.
  }
}

provider "aws" {
  alias  = "us_east_2"
  region = "us-east-2"
}

// Create a laucnh template for Auto Sclaing Group 

// Create a target group for the ALB to route traffic to the EC2 instances

/* Create an auto scaling group , and attach to a target group 
	-  Have to configure which subnets the EC2 instances will be launched in.
*/


