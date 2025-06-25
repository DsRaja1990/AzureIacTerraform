resource "azurerm_mysql_flexible_server" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  administrator_login = var.administrator_login
  administrator_password = var.administrator_password
  sku_name            = var.sku_name
  version             = var.version
  tags                = var.tags
}

resource "azurerm_private_endpoint" "this" {
  name                = "pe-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "psc-${var.name}"
    private_connection_resource_id  = azurerm_mysql_flexible_server.this.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "mysql-diagnostics"
  target_resource_id         = azurerm_mysql_flexible_server.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "MySqlLogs"
  }
}
