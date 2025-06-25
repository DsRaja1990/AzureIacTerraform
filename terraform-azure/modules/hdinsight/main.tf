terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_hdinsight_cluster" "this" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_version     = var.cluster_version
  tier                = var.tier
  tags                = local.tags
  component_version   = var.component_version
  gateway {
    enabled  = true
    username = var.gateway_username
    password = var.gateway_password
  }
  roles {
    head_node {
      vm_size  = var.head_node_vm_size
      username = var.head_node_username
      password = var.head_node_password
    }
    worker_node {
      vm_size               = var.worker_node_vm_size
      username              = var.worker_node_username
      password              = var.worker_node_password
      target_instance_count = var.worker_node_count
    }
    zookeeper_node {
      vm_size  = var.zookeeper_node_vm_size
      username = var.zookeeper_node_username
      password = var.zookeeper_node_password
    }
  }
  storage_account {
    storage_account_key = var.storage_account_key
    storage_container_id = var.storage_container_id
    is_default          = true
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "hdinsight-diag"
  target_resource_id         = azurerm_hdinsight_cluster.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "OperationalLogs"
  }
}
