# Azure Availability Set Module

This module provisions an Azure Availability Set.

## Usage Example
```hcl
module "availability_set" {
  source                = "./modules/availability_set"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  fault_domain_count    = 2
  update_domain_count   = 5
  tags                  = local.tags
}
```
