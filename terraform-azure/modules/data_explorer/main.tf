terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_kusto_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
  }
  tags = local.tags
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_kusto_database" "this" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_name        = azurerm_kusto_cluster.this.name
  hot_cache_period    = var.hot_cache_period
  soft_delete_period  = var.soft_delete_period
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "kusto-diag"
  target_resource_id         = azurerm_kusto_cluster.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "Command"
  }
}
