resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  transit_gateway_id = module.transit_gateway.transit_gateway_id
  vpc_id             = aws_vpc.frontend_vpc.id
  subnet_ids         = [aws_subnet.az1_private_subnet.id, aws_subnet.az2_private_subnet.id]
  tags = {
    Name = "Front_VPC_TGW_Attachment"
  }
}

