// app_insights main.tf



resource "azurerm_application_insights" "this" {
  name                = var.app_insights_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
  retention_in_days   = var.retention_in_days
  sampling_percentage = var.sampling_percentage
  disable_ip_masking  = var.disable_ip_masking
  tags                = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${var.app_insights_name}-diag"
  target_resource_id         = azurerm_application_insights.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AppTraces"
  }
  enabled_log {
    category = "AppRequests"
  }
  enabled_log {
    category = "AppDependencies"
  }
  enabled_log {
    category = "AppExceptions"
  }
  enabled_log {
    category = "AppMetrics"
  }
  enabled_log {
    category = "PerformanceCounters"
  }
  enabled_log {
    category = "BrowserTimings"
  }
  enabled_log {
    category = "CustomEvents"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_application_insights.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
