resource "aws_subnet" "bastion_host_subnet" {
  count                   = var.test == true ? 1 : 0
  vpc_id                  = aws_vpc.security_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.security_vpc.cidr_block, 8, 3)
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Security_VPC_Bastion_Host_Subnet"
  }
}

resource "aws_security_group" "bastion_host_sg" {
  count       = var.test == true ? 1 : 0
  description = "Allow traffic from Security VPC"
  vpc_id      = aws_vpc.security_vpc.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your specific CIDR block
  }

  ingress {
    from_port   = -1 # For ICMP, from_port and to_port are set to -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Group To allow SSH access from PC"
  }
}
resource "aws_route_table" "bastion_route_table" {
  count  = var.test == true ? 1 : 0
  vpc_id = aws_vpc.security_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "example_rta" {
  count          = var.test == true ? 1 : 0
  subnet_id      = aws_subnet.bastion_host_subnet[0].id
  route_table_id = aws_route_table.bastion_route_table[0].id
}

resource "aws_instance" "test_bastion_host" {
  count           = var.test == true ? 1 : 0
  ami             = data.aws_ami.latest_amazon_linux.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.bastion_host_subnet[0].id
  security_groups = [aws_security_group.bastion_host_sg[0].id]
  key_name        = "temp_keypair" // Hardcode value , use this as the keypair name you have saved that allows you to ssh into the instance

  tags = {
    Name = "Test Bastion host - Security VPC"
  }
}
