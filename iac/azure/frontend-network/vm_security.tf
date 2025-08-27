# Application Security Group
resource "azurerm_application_security_group" "asg_web" {
  name                = "asg-web"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name
}
resource "azurerm_network_security_rule" "allow_rdp_from_internet" {
  name                   = "allow-rdp"
  priority               = 103
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  destination_port_range = "3389"
  source_address_prefix  = "*"
  destination_application_security_group_ids = [
    azurerm_application_security_group.asg_web.id
  ]
  resource_group_name         = azurerm_resource_group.dev_group.name
  network_security_group_name = azurerm_network_security_group.frontend_sg.name
}

resource "azurerm_network_interface_application_security_group_association" "nic_asg_assoc" {
  network_interface_id          = azurerm_network_interface.nic.id
  application_security_group_id = azurerm_application_security_group.asg_web.id
}
