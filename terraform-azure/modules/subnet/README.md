# Azure Subnet Module

This module provisions an Azure Subnet with optional service endpoints and delegation.

## Usage Example
```hcl
module "subnet" {
  source               = "./modules/subnet"
  naming_prefix        = var.naming_prefix
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = ["10.0.1.0/24"]
}
```
