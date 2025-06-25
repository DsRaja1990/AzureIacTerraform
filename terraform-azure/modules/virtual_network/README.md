# Azure Virtual Network Module

This module provisions an Azure Virtual Network with custom address space and DNS.

## Usage Example
```hcl
module "vnet" {
  source              = "./modules/virtual_network"
  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  tags                = local.tags
}
```
