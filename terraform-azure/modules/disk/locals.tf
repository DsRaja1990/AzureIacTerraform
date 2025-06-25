locals {
  disk_name = "${var.naming_prefix}-disk"
  tags      = merge(var.tags, { module = "disk" })
}
