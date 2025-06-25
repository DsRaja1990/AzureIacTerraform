// Azure VPN module main.tf

resource "azurerm_vpn_gateway" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  virtual_hub_id      = var.virtual_hub_id
  bgp_settings {
    asn         = var.bgp_asn
    peer_weight = var.peer_weight
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "vpn-diagnostics"
  target_resource_id         = azurerm_vpn_gateway.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
