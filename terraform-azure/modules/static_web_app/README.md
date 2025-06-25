# Azure Static Web App Module

This module provisions an Azure Static Web App.

## Usage Example
```hcl
module "static_web_app" {
  source                = "./modules/static_web_app"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  sku_tier              = "Standard"
  repository_url        = "https://github.com/your/repo"
  branch                = "main"
  app_location          = "/"
  api_location          = "api"
  output_location       = "build"
  tags                  = local.tags
}
```
