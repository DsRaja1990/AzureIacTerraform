locals {
  funcapp_name = "${var.naming_prefix}-funcapp"
  pe_name      = "${var.naming_prefix}-funcapp-pe"
  tags         = merge(var.tags, { module = "function_app" })
}
