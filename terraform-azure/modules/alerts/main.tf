// alerts main.tf



resource "azurerm_monitor_action_group" "this" {
  name                = var.action_group_name
  resource_group_name = var.resource_group_name
  short_name          = var.action_group_short_name
  email_receiver {
    name          = var.email_receiver_name
    email_address = var.email_receiver_address
  }
  tags = local.tags
}

resource "azurerm_monitor_metric_alert" "this" {
  name                = var.metric_alert_name
  resource_group_name = var.resource_group_name
  scopes              = var.metric_alert_scopes
  description         = var.metric_alert_description
  severity            = var.metric_alert_severity
  enabled             = var.metric_alert_enabled
  frequency           = var.metric_alert_frequency
  window_size         = var.metric_alert_window_size
  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = var.metric_name
    aggregation      = var.aggregation
    operator         = var.operator
    threshold        = var.threshold
  }
  action {
    action_group_id = azurerm_monitor_action_group.this.id
  }
  tags = local.tags
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_monitor_metric_alert.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
