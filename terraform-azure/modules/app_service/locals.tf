locals {
  asp_name  = "${var.naming_prefix}-asp"
  app_name  = "${var.naming_prefix}-app"
  pe_name   = "${var.naming_prefix}-app-pe"
  tags      = merge(var.tags, { module = "app_service" })
}
