### VPC Module Management

Each VPC Will be treated as a seperate terraform module, therefore ```terraform init``` will be run in each vpc folder.

### Useful Links

- [Hashicorp provider documentation](https://registry.terraform.io/providers/hashicorp/aws/5.32.1/docs)
- 

### Architecture Notes

1. Security VPC - Hosts the Transit gateway.
   1. Still need to configure EC2 instance.

### Output variables

1. Security VPC 
   - CIDR_Block - CIDR Range of the VPC
   - transit_gateway_id - Transit gateway ID for the 