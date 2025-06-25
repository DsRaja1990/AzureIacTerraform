# Azure Firewall Module

This module provisions an Azure Firewall with a public IP and subnet.

## Usage Example
```hcl
module "firewall" {
  source                = "./modules/firewall"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  subnet_id             = module.subnet.subnet_id
  public_ip_address_id  = azurerm_public_ip.fw.id
  tags                  = local.tags
}
```
