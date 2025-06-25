resource "azurerm_image" "this" {
  name                = local.image_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_disk {
    os_type      = var.os_type
    os_state     = var.os_state
    blob_uri     = var.blob_uri
    caching      = var.caching
    storage_type = var.storage_type
  }
  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.image_name}-diag"
  target_resource_id         = azurerm_image.this.id
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
  scope                = azurerm_image.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
