# Azure Bastion Module

This module provisions an Azure Bastion Host for secure VM access.

## Usage Example
```hcl
module "bastion" {
  source                = "./modules/bastion"
  naming_prefix         = var.naming_prefix
  location              = var.location
  resource_group_name   = azurerm_resource_group.main.name
  dns_name              = "bastion.example.com"
  subnet_id             = module.subnet.subnet_id
  public_ip_address_id  = azurerm_public_ip.bastion.id
  tags                  = local.tags
}
```
