locals {
  nsg_name = "${var.naming_prefix}-nsg"
  tags     = merge(var.tags, { module = "nsg" })
}
