resource "aws_instance" "firewall_instance" {
  ami             = var.firewall_instance_ami_id
  instance_type   = var.firewall_ec2_instance_type
  subnet_id       = aws_subnet.security_vpc_public_subnet.id
  security_groups = [aws_security_group.allow_connection_from_everywhere_sg.id]

  tags = {
    Name = "firewall-instance"
  }  
}