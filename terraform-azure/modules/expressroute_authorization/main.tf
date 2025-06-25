// Azure ExpressRoute Circuit Authorization module main.tf

resource "azurerm_express_route_authorization" "this" {
  name                          = var.name
  express_route_circuit_name   = var.express_route_circuit_name
  resource_group_name           = var.resource_group_name
}
