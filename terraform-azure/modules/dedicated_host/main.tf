resource "azurerm_dedicated_host_group" "this" {
  name                = local.host_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = var.fault_domain_count
  tags                = local.tags
}

resource "azurerm_dedicated_host" "this" {
  name                 = local.host_name
  location             = var.location
  dedicated_host_group_id = azurerm_dedicated_host_group.this.id
  sku_name             = var.sku_name
  platform_fault_domain = var.platform_fault_domain
  auto_replace_on_failure = var.auto_replace_on_failure
  tags                 = local.tags
}
