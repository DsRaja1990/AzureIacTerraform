locals {
  firewall_name = "${var.naming_prefix}-fw"
  tags         = merge(var.tags, { module = "firewall" })
}
