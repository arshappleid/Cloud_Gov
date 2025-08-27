resource "azurerm_network_security_group" "frontend_sg" {
  name                = "FrontEndSecurity_Group"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name
}


resource "azurerm_virtual_network" "frontend_network" {
  name                = "${azurerm_resource_group.dev_group.name}-frontend-network"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name
  address_space       = ["10.1.0.0/16"]
  dns_servers         = ["10.1.0.4", "10.1.0.5"]


  tags = {
    environment = "Dev"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.dev_group.name
  virtual_network_name = azurerm_virtual_network.frontend_network.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.dev_group.name
  virtual_network_name = azurerm_virtual_network.frontend_network.name
  address_prefixes     = ["10.1.2.0/24"]

}
