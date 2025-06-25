# Azure Virtual Machine Module

This module provisions an Azure Linux Virtual Machine.

## Usage Example
```hcl
module "virtual_machine" {
  source                = "./modules/virtual_machine"
  naming_prefix         = var.naming_prefix
  resource_group_name   = azurerm_resource_group.main.name
  location              = var.location
  size                  = "Standard_B2ms"
  admin_username        = "azureuser"
  admin_ssh_public_key  = file("~/.ssh/id_rsa.pub")
  network_interface_id  = azurerm_network_interface.vm.id
  tags                  = local.tags
}
```
