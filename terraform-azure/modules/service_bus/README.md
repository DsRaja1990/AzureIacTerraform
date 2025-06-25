# Azure Service Bus Module

This module provisions an Azure Service Bus Namespace and Queue.

## Usage Example
```hcl
module "service_bus" {
  source                = "./modules/service_bus"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  sku                   = "Standard"
  tags                  = local.tags
}
```
