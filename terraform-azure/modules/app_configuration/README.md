# Azure App Configuration Module

This module provisions a production-ready Azure App Configuration store with secure defaults, managed identity, and full parameterization.

## Usage Example
```hcl
module "app_configuration" {
  source                    = "./modules/app_configuration"
  name                      = "my-appconfig"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  sku                       = "standard"
  public_network_access     = "Enabled"
  tags                      = local.tags
}
```

## Outputs
- `app_configuration_id`       : App Configuration resource ID
- `app_configuration_endpoint` : App Configuration endpoint
