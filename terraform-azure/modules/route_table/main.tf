resource "azurerm_route_table" "this" {
  name                = local.route_table_name
  location            = var.location
  resource_group_name = var.resource_group_name
  route               = var.routes
  tags                = local.tags
}
