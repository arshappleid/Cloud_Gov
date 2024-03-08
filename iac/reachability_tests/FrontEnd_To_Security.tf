resource "aws_ec2_network_insights_path" "FrontEndVPC_to_SecurityVPC" {
  source      = aws_
  destination = aws_network_interface.destination.id
  protocol    = "tcp"
}

resource "aws_ec2_network_insights_analysis" "analysis" {
  network_insights_path_id = aws_ec2_network_insights_path.path.id
}