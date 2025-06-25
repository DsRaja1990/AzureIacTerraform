// Azure Logic Apps Standard module main.tf

resource "azurerm_logic_app_standard" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id
  storage_account_name = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  tags                = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "logicappstandard-diagnostics"
  target_resource_id         = azurerm_logic_app_standard.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "WorkflowRuntime"
  }
}
