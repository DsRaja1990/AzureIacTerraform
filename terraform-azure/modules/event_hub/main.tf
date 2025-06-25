resource "azurerm_eventhub_namespace" "this" {
  name                = local.ehns_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  tags                = local.tags
}

resource "azurerm_eventhub" "this" {
  name                = local.eh_name
  namespace_id        = azurerm_eventhub_namespace.this.id
  partition_count     = var.partition_count
  message_retention   = var.message_retention
}

resource "azurerm_eventhub_consumer_group" "this" {
  name                = local.consumer_group_name
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = azurerm_eventhub.this.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_eventhub_namespace_authorization_rule" "this" {
  name                = local.auth_rule_name
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.resource_group_name
  listen              = true
  send                = true
  manage              = true
}

resource "azurerm_eventhub_authorization_rule" "this" {
  name                = local.eh_auth_rule_name
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = azurerm_eventhub.this.name
  resource_group_name = var.resource_group_name
  listen              = true
  send                = true
  manage              = false
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "eventhub-diag"
  target_resource_id         = azurerm_eventhub_namespace.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "OperationalLogs"
  }
}
