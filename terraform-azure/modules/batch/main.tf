// Azure Batch module main.tf

resource "azurerm_batch_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  pool_allocation_mode = var.pool_allocation_mode
  identity {
    type = var.identity_type
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "batch-diagnostics"
  target_resource_id         = azurerm_batch_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
