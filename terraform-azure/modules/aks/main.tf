terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version
  sku_tier            = var.sku_tier
  private_cluster_enabled = var.private_cluster_enabled
  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
    min_count = var.min_count
    max_count = var.max_count
    vnet_subnet_id = var.vnet_subnet_id
  }
  identity {
    type = "SystemAssigned"
  }
  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy
    load_balancer_sku = var.load_balancer_sku
  }
  role_based_access_control_enabled = true
  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.admin_group_object_ids
  }
  tags = local.tags
}
