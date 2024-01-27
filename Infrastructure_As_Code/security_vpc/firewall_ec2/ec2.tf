resource "aws_instance" "firewall_instance_1" {
  ami             = var.firewall_instance_ami_id
  instance_type   = var.firewall_ec2_instance_type
  subnet_id       = var.ec2_subnet1_Id
  security_groups = [aws_security_group.allow_connection_from_everywhere_sg.id]

  tags = {
    Name = "firewall-instance-1"
  }  
}


resource "aws_instance" "firewall_instance_2" {
  ami             = var.firewall_instance_ami_id
  instance_type   = var.firewall_ec2_instance_type
  subnet_id       = var.ec2_subnet2_Id
  security_groups = [aws_security_group.allow_connection_from_everywhere_sg.id]

  tags = {
    Name = "firewall-instance-2"
  }  
}

