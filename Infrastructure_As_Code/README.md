### VPC Module Management

Each VPC Will be treated as a seperate terraform module, therefore ```terraform init``` will be run in each vpc folder.

### Architecture Notes

1. Security VPC - Hosts the Transit gateway.

### Output variables

1. Security VPC 
   - CIDR_Block - CIDR Range of the VPC
   - transit_gateway_id - Transit gateway ID for the 