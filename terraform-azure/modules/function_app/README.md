# Azure Function App Module

This module provisions an Azure Function App with private endpoint and DNS.

## Usage Example
```hcl
module "function_app" {
  source                      = "./modules/function_app"
  naming_prefix               = var.naming_prefix
  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  app_service_plan_id         = module.app_service.app_service_plan_id
  storage_account_name        = module.storage_account.storage_account_name
  storage_account_access_key  = module.storage_account.primary_access_key
  subnet_id                   = module.subnet.subnet_id
  vnet_id                     = module.vnet.vnet_id
  tags                        = local.tags
}
```
