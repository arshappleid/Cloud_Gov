required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.7.0"
  }

  // azurerm = {
  //     source = "hashicorp/azurerm"
  //     version = "~> 3.100.0"
  //   }
}

provider "aws" "configurations" {
  for_each = var.aws_regions

  config {
    region = each.value

    default_tags {
      tags = var.default_tags
    }
  }
}

// provider "azurerm" "configurations" {
//   # Configuration options
//   for_each = var.azure_regions

//   config{
//     region = each.value

//     default_tags = {
//       tags = var.default_tags
//     }
//   }
// }