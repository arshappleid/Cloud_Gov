# Create an S3 bucket for storing the flow logs
resource "aws_s3_bucket" "flow_logs_bucket" {
  bucket        = "cloudgov-tgw-flow-logs-bucket"
  force_destroy = true
  tags = {
    Name = "CloudGov_TGW_Flow_Logs"
  }

  lifecycle_rule {
    enabled = true
    expiration {
      days = 1
    }
  }

}

# Create a flow log for the Transit Gateway
resource "aws_flow_log" "tgw_flow_log" {
  log_destination_type = "s3"
  log_destination      = aws_s3_bucket.flow_logs_bucket.arn
  traffic_type         = "ALL"
  transit_gateway_id   = aws_ec2_transit_gateway.Main_Transity_Gateway.id

  max_aggregation_interval = 60
}