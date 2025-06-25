// Azure Automation Account module main.tf

resource "azurerm_automation_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  identity {
    type = var.identity_type
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "automationaccount-diagnostics"
  target_resource_id         = azurerm_automation_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
