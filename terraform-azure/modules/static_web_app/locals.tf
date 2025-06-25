locals {
  swa_name = "${var.naming_prefix}-swa"
  tags     = merge(var.tags, { module = "static_web_app" })
}
