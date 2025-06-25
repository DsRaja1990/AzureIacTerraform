locals {
  vmss_name = "${var.naming_prefix}-vmss"
  tags      = merge(var.tags, { module = "virtual_machine_scale_set" })
}
