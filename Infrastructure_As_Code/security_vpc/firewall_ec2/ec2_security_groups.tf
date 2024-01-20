resource "aws_security_group" "allow_connection_from_everywhere_sg" {
  vpc_id = var.ec2_vpc_Id

  // Allow connection from everywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}