locals {
  vnet_name = "${var.naming_prefix}-vnet"
  tags      = merge(var.tags, { module = "virtual_network" })
}
