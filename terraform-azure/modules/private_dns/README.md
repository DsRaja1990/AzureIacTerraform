# Azure Private DNS Module

This module provisions an Azure Private DNS Zone and links it to a Virtual Network.

## Usage Example
```hcl
module "private_dns" {
  source                = "./modules/private_dns"
  naming_prefix         = var.naming_prefix
  resource_group_name   = azurerm_resource_group.main.name
  dns_zone_name         = "privatelink.database.windows.net"
  vnet_id               = module.vnet.vnet_id
  registration_enabled  = false
  tags                  = local.tags
}
```
