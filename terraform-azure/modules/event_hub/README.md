# Azure Event Hub Module

This module provisions an Azure Event Hub Namespace and Event Hub.

## Usage Example
```hcl
module "event_hub" {
  source                = "./modules/event_hub"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  sku                   = "Standard"
  tags                  = local.tags
}
```
