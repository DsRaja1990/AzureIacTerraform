resource "azurerm_static_site" "this" {
  name                = local.swa_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_tier            = var.sku_tier
  tags = local.tags
}
