# Azure API Management Module

This module provisions an Azure API Management instance with private endpoint and DNS.

## Usage Example
```hcl
module "api_management" {
  source                = "./modules/api_management"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  publisher_name        = "Your Company"
  publisher_email       = "admin@company.com"
  sku_name              = "Developer_1"
  virtual_network_type  = "External"
  subnet_id             = module.subnet.subnet_id
  vnet_id               = module.vnet.vnet_id
  tags                  = local.tags
}
```
