# Azure Managed Disk Module

This module provisions an Azure Managed Disk.

## Usage Example
```hcl
module "disk" {
  source                = "./modules/disk"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  storage_account_type  = "Standard_LRS"
  create_option         = "Empty"
  disk_size_gb          = 128
  tags                  = local.tags
}
```
