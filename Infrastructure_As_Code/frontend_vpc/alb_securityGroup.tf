resource "aws_security_group" "alb_sg" {
    vpc_id = aws_vpc.frontend_vpc.id

    // Assuming ALB is public facing
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
