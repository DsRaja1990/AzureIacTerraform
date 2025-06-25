# Azure Route Table Module

This module provisions an Azure Route Table with custom routes.

## Usage Example
```hcl
module "route_table" {
  source              = "./modules/route_table"
  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  routes              = []
  tags                = local.tags
}
```
