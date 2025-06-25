# Azure Virtual Machine Scale Set (VMSS) Module

This module provisions an Azure Linux Virtual Machine Scale Set.

## Usage Example
```hcl
module "virtual_machine_scale_set" {
  source                = "./modules/virtual_machine_scale_set"
  naming_prefix         = var.naming_prefix
  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  sku                   = "Standard_B2ms"
  instances             = 2
  admin_username        = "azureuser"
  admin_ssh_public_key  = file("~/.ssh/id_rsa.pub")
  subnet_id             = module.subnet.subnet_id
  tags                  = local.tags
}
```
