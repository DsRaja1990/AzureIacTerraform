resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false
  identity {
    type = "SystemAssigned"
  }
  dynamic "azuread_administrator" {
    for_each = var.azuread_administrators
    content {
      login_username              = azuread_administrator.value.login_username
      object_id                   = azuread_administrator.value.object_id
      tenant_id                   = azuread_administrator.value.tenant_id
      azuread_authentication_only = azuread_administrator.value.azuread_authentication_only
    }
  }
  dynamic "customer_managed_key" {
    for_each = var.cmk_key_vault_key_id != null && var.user_assigned_identity_id != null ? [1] : []
    content {
      key_vault_key_id         = var.cmk_key_vault_key_id
      user_assigned_identity_id = var.user_assigned_identity_id
    }
  }
  tags = local.tags
}

resource "azurerm_mssql_database" "this" {
  name                = var.sql_database_name
  server_id           = azurerm_mssql_server.this.id
  sku_name            = var.sku_name
  collation           = var.collation
  max_size_gb         = var.max_size_gb
  zone_redundant      = var.zone_redundant
  read_scale          = var.read_scale
  tags                = local.tags
}

resource "azurerm_private_endpoint" "this" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = "${var.sql_server_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  private_service_connection {
    name                           = "${var.sql_server_name}-pe-conn"
    private_connection_resource_id  = azurerm_mssql_server.this.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${var.sql_server_name}-diag"
  target_resource_id         = azurerm_mssql_server.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "SQLSecurityAuditEvents"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_mssql_server.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
