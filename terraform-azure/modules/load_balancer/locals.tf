locals {
  lb_name = "${var.naming_prefix}-lb"
  tags    = merge(var.tags, { module = "load_balancer" })
}
