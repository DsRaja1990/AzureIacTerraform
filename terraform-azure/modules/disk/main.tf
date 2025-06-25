resource "azurerm_managed_disk" "this" {
  name                 = local.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.disk_name}-diag"
  target_resource_id         = azurerm_managed_disk.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "DiskReadOperations"
  }
  enabled_log {
    category = "DiskWriteOperations"
  }
  enabled_log {
    category = "DiskErrors"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_managed_disk.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
