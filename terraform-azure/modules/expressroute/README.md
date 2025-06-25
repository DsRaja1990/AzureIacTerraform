# Azure ExpressRoute Module

This module provisions an Azure ExpressRoute circuit.

## Usage Example
```hcl
module "expressroute" {
  source                = "./modules/expressroute"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  service_provider_name = "Equinix"
  peering_location      = "Silicon Valley"
  bandwidth_in_mbps     = 200
  tags                  = local.tags
}
```
