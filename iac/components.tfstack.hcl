component "aws"{
	for_each = var.aws_regions

	source = "./aws"

	inputs = {
		region = var.aws_regions
	}

	providers = {
		aws  = provider.aws.configurations[each.value]
		// Other Module Variables
		// module_var_name = var.var_name
	}
}

component "azure" {
	for_each = var.azure_regions

	source = "./azure"

	inputs = {
		region = var.var.azure_regions
		// Other Module Variables
		// module_var_name = var.var_name
	}
}