resource "azurerm_availability_set" "this" {
  name                         = local.avset_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = var.fault_domain_count
  platform_update_domain_count = var.update_domain_count
  managed                      = true
  tags                         = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.avset_name}-diag"
  target_resource_id         = azurerm_availability_set.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "Administrative"
  }
  enabled_log {
    category = "Security"
  }
  enabled_log {
    category = "ServiceHealth"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_availability_set.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
