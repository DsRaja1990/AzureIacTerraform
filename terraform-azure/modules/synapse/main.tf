terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_synapse_workspace" "this" {
  name                                 = var.workspace_name
  resource_group_name                  = var.resource_group_name
  location                             = var.location
  storage_data_lake_gen2_filesystem_id = var.data_lake_filesystem_id
  sql_administrator_login              = var.sql_admin_login
  sql_administrator_login_password     = var.sql_admin_password
  managed_virtual_network_enabled      = true
  identity {
    type = "SystemAssigned"
  }
  tags = local.tags
}

resource "azurerm_synapse_sql_pool" "this" {
  name                 = var.sql_pool_name
  synapse_workspace_id = azurerm_synapse_workspace.this.id
  sku_name             = var.sql_pool_sku
  create_mode          = "Default"
  storage_account_type = "GRS"
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "synapse-diag"
  target_resource_id         = azurerm_synapse_workspace.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "SynapseWorkspaceAudit"
  }
}
