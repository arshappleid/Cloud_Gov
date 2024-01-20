resource "aws_subnet" "bastion_host_subnet" {
  count             = var.test == true ? 1 : 0
  vpc_id            = aws_vpc.frontend_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.frontend_vpc.cidr_block, 8, 3)
  availability_zone = "us-east-1a"
   map_public_ip_on_launch = true
  tags = {
    Name = "Bastion Host Subnet"
  }
}

resource "aws_security_group" "bastion_host_sg" {
  count       = var.test == true ? 1 : 0
  description = "Allow traffic from Security VPC"
  vpc_id      = aws_vpc.frontend_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.Securtiy_VPC_CIDR}"] # Replace with your specific CIDR block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Group To allow SSH access from Security VPC"
  }
}

resource "aws_instance" "test_bastion_host" {
  count           = var.test == true ? 1 : 0
  ami             = data.aws_ami.latest_amazon_linux.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.bastion_host_subnet[0].id
  security_groups = [aws_security_group.bastion_host_sg[0].id]


  tags = {
    Name = "Tes Bastion Host - FrontEnd VPC"
  }
}
