resource "aws_instance" "firewall_instance" {
  for_each = var.ec2_subnets_Ids

  ami             = var.firewall_instance_ami_id
  instance_type   = var.firewall_ec2_instance_type
  subnet_id       = each.value
  security_groups = [aws_security_group.allow_connection_from_everywhere_sg.id]

  tags = {
    Name = "firewall-instance-${each.value}"
  }  
}

