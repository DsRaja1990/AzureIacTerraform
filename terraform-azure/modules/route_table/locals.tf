locals {
  route_table_name = "${var.naming_prefix}-rt"
  tags            = merge(var.tags, { module = "route_table" })
}
