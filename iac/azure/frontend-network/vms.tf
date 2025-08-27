resource "azurerm_public_ip" "temp_public_ip" {
  name                = "PublicIPForVM"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name
  allocation_method   = "Static"
}

# NIC
resource "azurerm_network_interface" "nic" {
  name                = "nic-web"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name

  ip_configuration {
    name      = "ipconfig1"
    subnet_id = azurerm_subnet.subnet1.id

    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.temp_public_ip.id ## Lets not assign public ip , since not needed
  }
}


# VM
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-web"
  location            = azurerm_resource_group.dev_group.location
  resource_group_name = azurerm_resource_group.dev_group.name
  size                = "Standard_B1ms"

  admin_username = "azureuser"
  admin_password = "P@ssword123!" # store in Key Vault/TF vars in real use

  network_interface_ids = [azurerm_network_interface.nic.id]
  computer_name         = "VMWEB"
  provision_vm_agent    = true

  os_disk {
    name                 = "osdisk-web"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }
}

