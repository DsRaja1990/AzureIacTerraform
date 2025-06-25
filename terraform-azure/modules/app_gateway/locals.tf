locals {
  appgw_name = "${var.naming_prefix}-appgw"
  tags       = merge(var.tags, { module = "app_gateway" })
}
