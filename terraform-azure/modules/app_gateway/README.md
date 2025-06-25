# Azure Application Gateway Module

This module provisions an Azure Application Gateway (App Gateway).

## Usage Example
```hcl
module "app_gateway" {
  source                = "./modules/app_gateway"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  subnet_id             = module.subnet.subnet_id
  public_ip_address_id  = azurerm_public_ip.appgw.id
  backend_fqdns         = ["app1.example.com"]
  tags                  = local.tags
}
```
