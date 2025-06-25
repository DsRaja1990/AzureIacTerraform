# Azure Load Balancer Module

This module provisions an Azure Load Balancer (Standard SKU).

## Usage Example
```hcl
module "load_balancer" {
  source                = "./modules/load_balancer"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  public_ip_address_id  = azurerm_public_ip.lb.id
  subnet_id             = module.subnet.subnet_id
  tags                  = local.tags
}
```
