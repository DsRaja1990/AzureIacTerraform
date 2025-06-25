locals {
  vpn_gw_name = "${var.naming_prefix}-vpngw"
  tags        = merge(var.tags, { module = "vpn_gateway" })
}
