locals {
  er_name = "${var.naming_prefix}-er"
  tags    = merge(var.tags, { module = "expressroute" })
}
