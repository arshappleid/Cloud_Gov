source "azure-arm" "ubuntu" {
  subscription_id                   = var.azure_subscription_id != "" ? var.azure_subscription_id : env("ARM_SUBSCRIPTION_ID")
  tenant_id                         = var.azure_tenant_id != "" ? var.azure_tenant_id : env("ARM_TENANT_ID")
  client_id                         = var.azure_client_id != "" ? var.azure_client_id : env("ARM_CLIENT_ID")
  client_secret                     = var.azure_client_secret != "" ? var.azure_client_secret : env("ARM_CLIENT_SECRET")
  managed_image_resource_group_name = "packer_images"
  managed_image_name                = "packer-ubuntu-azure-${local.timestamp}"

  os_type         = "Linux"
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts"

  azure_tags = {
    Created-by = "Packer"
    OS_Version = "Ubuntu 22.04"
    Release    = "Latest"
  }

  location = "East US"
  vm_size  = "Standard_D2s_v3"
}