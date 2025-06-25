# Azure Logic App Module

This module provisions an Azure Logic App (Standard) workflow.

## Usage Example
```hcl
module "logic_app" {
  source                = "./modules/logic_app"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  definition            = file("./logicapp-definition.json")
  parameters            = {}
  tags                  = local.tags
}
```
