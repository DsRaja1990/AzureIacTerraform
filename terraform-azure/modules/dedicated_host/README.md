# Azure Dedicated Host Module

This module provisions an Azure Dedicated Host and Host Group.

## Usage Example
```hcl
module "dedicated_host" {
  source                    = "./modules/dedicated_host"
  naming_prefix             = var.naming_prefix
  location                  = var.location
  resource_group_name       = azurerm_resource_group.main.name
  fault_domain_count        = 1
  zones                     = ["1"]
  sku_name                  = "DSv3-Type1"
  platform_fault_domain     = 0
  auto_replace_on_failure   = true
  tags                      = local.tags
}
```
