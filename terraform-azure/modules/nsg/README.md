# Azure Network Security Group (NSG) Module

This module provisions an Azure NSG with custom security rules.

## Usage Example
```hcl
module "nsg" {
  source              = "./modules/nsg"
  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  security_rules      = []
  tags                = local.tags
}
```
