# Azure App Service Module

This module provisions an Azure App Service (Web App) with:
- App Service Plan
- Private Endpoint
- Private DNS Zone
- Secure defaults (HTTPS only, managed identity, FTPS, TLS 1.2)
- Tags and naming convention

## Usage Example

```hcl
module "app_service" {
  source              = "./modules/app_service"
  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  vnet_id             = module.vnet.vnet_id
  subnet_id           = module.vnet.app_subnet_id
  tags                = local.tags
}
```

## Inputs
See `variables.tf` for all input variables.

## Outputs
See `outputs.tf` for all outputs.
