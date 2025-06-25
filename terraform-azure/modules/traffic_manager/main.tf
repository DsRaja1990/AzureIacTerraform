resource "azurerm_traffic_manager_profile" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  profile_status      = var.profile_status
  traffic_routing_method = var.traffic_routing_method
  dns_config {
    relative_name = var.dns_relative_name
    ttl           = var.dns_ttl
  }
  monitor_config {
    protocol                     = var.monitor_protocol
    port                         = var.monitor_port
    path                         = var.monitor_path
    interval_in_seconds          = var.monitor_interval_in_seconds
    timeout_in_seconds           = var.monitor_timeout_in_seconds
    tolerated_number_of_failures = var.monitor_tolerated_number_of_failures
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "trafficmanager-diagnostics"
  target_resource_id         = azurerm_traffic_manager_profile.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AllMetrics"
  }
}
