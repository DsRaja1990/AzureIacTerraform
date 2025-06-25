resource "azurerm_api_management" "this" {
  name                = local.apim_name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name
  virtual_network_type = var.virtual_network_type
  identity {
    type = "SystemAssigned"
  }
  tags                = local.tags
}

resource "azurerm_private_endpoint" "this" {
  name                = local.pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "${local.pe_name}-conn"
    private_connection_resource_id  = azurerm_api_management.this.id
    subresource_names              = ["gateway"]
    is_manual_connection           = false
  }
  tags = local.tags
}

resource "azurerm_private_dns_zone" "this" {
  name                = "privatelink.azure-api.net"
  resource_group_name = var.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = "${local.pe_name}-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
  tags                  = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.apim_name}-diag"
  target_resource_id         = azurerm_api_management.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "GatewayLogs"
  }
  enabled_log {
    category = "AuditLogs"
  }
  enabled_log {
    category = "EventHubLogs"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_api_management.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
