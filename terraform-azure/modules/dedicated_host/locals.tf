locals {
  host_group_name = "${var.naming_prefix}-hostgroup"
  host_name       = "${var.naming_prefix}-host"
  tags           = merge(var.tags, { module = "dedicated_host" })
}
