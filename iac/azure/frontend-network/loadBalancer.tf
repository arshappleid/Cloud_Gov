resource "azurerm_public_ip" "frontEnd_public_ip" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "frontend_lb" {
  name                = "${azurerm_resource_group.dev_group.name}-FrontEnd-LB"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name

  frontend_ip_configuration {
    name                 = "${azurerm_resource_group.dev_group.name}-FrontEnd-LB-PublicIP"
    public_ip_address_id = azurerm_public_ip.frontEnd_public_ip.id
  }
}

