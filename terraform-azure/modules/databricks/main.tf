terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_databricks_workspace" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  managed_resource_group_name = var.managed_resource_group_name
  tags                = local.tags
  custom_parameters {
    no_public_ip = var.no_public_ip
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "databricks-diag"
  target_resource_id         = azurerm_databricks_workspace.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AllLogs"
  }
}
