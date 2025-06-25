// Azure Media Services module main.tf

resource "azurerm_media_services_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  storage_account {
    id = var.storage_account_id
    is_primary = true
  }
  identity {
    type = var.identity_type
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "mediaservices-diagnostics"
  target_resource_id         = azurerm_media_services_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
