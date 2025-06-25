// Azure Peering Service module main.tf

resource "azurerm_peering_service" "this" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  peering_service_location      = var.peering_service_location
  peering_service_provider_name = var.peering_service_provider_name
  tags                          = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "peeringservice-diagnostics"
  target_resource_id         = azurerm_peering_service.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
