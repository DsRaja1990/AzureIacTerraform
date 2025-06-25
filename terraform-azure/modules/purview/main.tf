terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_purview_account" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  identity {
    type = "SystemAssigned"
  }
  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "purview-diag"
  target_resource_id         = azurerm_purview_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "Audit"
  }
}
