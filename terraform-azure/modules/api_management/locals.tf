locals {
  apim_name = "${var.naming_prefix}-apim"
  pe_name   = "${var.naming_prefix}-apim-pe"
  tags      = merge(var.tags, { module = "api_management" })
}
