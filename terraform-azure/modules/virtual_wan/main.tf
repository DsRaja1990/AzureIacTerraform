// Azure Virtual WAN module main.tf

resource "azurerm_virtual_wan" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = var.type
  disable_vpn_encryption = var.disable_vpn_encryption
  office365_local_breakout_category = var.office365_local_breakout_category
  tags                = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "virtualwan-diagnostics"
  target_resource_id         = azurerm_virtual_wan.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
