locals {
  logicapp_name = "${var.naming_prefix}-logicapp"
  tags          = merge(var.tags, { module = "logic_app" })
}
