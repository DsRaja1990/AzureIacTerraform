resource "azurerm_virtual_network" "this" {
  name                = local.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers
  tags                = local.tags
}
