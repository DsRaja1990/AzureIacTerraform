locals {
  vnet_link_name = "${var.naming_prefix}-vnet-link"
  tags           = merge(var.tags, { module = "private_dns" })
}
