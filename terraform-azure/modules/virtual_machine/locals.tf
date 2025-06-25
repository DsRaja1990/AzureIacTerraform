locals {
  vm_name = "${var.naming_prefix}-vm"
  tags    = merge(var.tags, { module = "virtual_machine" })
}
