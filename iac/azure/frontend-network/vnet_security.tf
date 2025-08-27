resource "azurerm_network_security_rule" "allow_http" {
  name                        = "allow-HTTP-from-Central-VPC"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dev_group.name
  network_security_group_name = azurerm_network_security_group.frontend_sg.name
}

resource "azurerm_network_security_rule" "allow_rdp" {
  name                        = "allow-RDP-from-anywhere"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "0.0.0.0/0"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.dev_group.name
  network_security_group_name = azurerm_network_security_group.frontend_sg.name
}

