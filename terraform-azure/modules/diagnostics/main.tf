// diagnostics main.tf

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.diagnostic_name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  dynamic "enabled_log" {
    for_each = var.enabled_logs
    content {
      category = enabled_log.value
    }
  }
  dynamic "metric" {
    for_each = var.metrics
    content {
      category = metric.value
      enabled  = true
    }
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = var.target_resource_id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
