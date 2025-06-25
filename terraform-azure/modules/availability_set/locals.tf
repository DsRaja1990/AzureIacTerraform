locals {
  avset_name = "${var.naming_prefix}-avset"
  tags       = merge(var.tags, { module = "availability_set" })
}
