# Azure VPN Gateway Module

This module provisions an Azure VPN Gateway for secure site-to-site or point-to-site connectivity.

## Usage Example
```hcl
module "vpn_gateway" {
  source                = "./modules/vpn_gateway"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  public_ip_address_id  = azurerm_public_ip.vpn.id
  subnet_id             = module.subnet.subnet_id
  tags                  = local.tags
}
```
