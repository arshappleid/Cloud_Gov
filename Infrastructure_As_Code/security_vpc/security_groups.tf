resource "aws_security_group" "allow_connection_from_everywhere_sg" {
  vpc_id = aws_vpc.security_vpc.id

  // Allow connection from everywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}