resource "azurerm_redis_cache" "this" {
  name                = var.redis_cache_name
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku_name
  minimum_tls_version = "1.2"
  public_network_access_enabled = false
  shard_count         = var.shard_count
  subnet_id           = var.subnet_id
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}

resource "azurerm_private_endpoint" "this" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = "${var.redis_cache_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  private_service_connection {
    name                           = "${var.redis_cache_name}-pe-conn"
    private_connection_resource_id  = azurerm_redis_cache.this.id
    subresource_names              = ["redisCache"]
    is_manual_connection           = false
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${var.redis_cache_name}-diag"
  target_resource_id         = azurerm_redis_cache.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "ConnectedClientList"
  }
  enabled_log {
    category = "RedisCommands"
  }
  enabled_log {
    category = "ServerLoad"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_redis_cache.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
