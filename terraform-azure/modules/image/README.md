# Azure Image Module

This module provisions an Azure Managed Image from a blob URI.

## Usage Example
```hcl
module "image" {
  source                = "./modules/image"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  os_type               = "Linux"
  os_state              = "Generalized"
  blob_uri              = "https://.../osdisk.vhd"
  caching               = "ReadWrite"
  tags                  = local.tags
}
```
