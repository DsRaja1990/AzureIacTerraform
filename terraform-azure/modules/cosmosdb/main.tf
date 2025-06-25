terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_cosmosdb_account" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = var.offer_type
  kind                = var.kind
  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }
  geo_location {
    location          = var.location
    failover_priority = 0
  }
  dynamic "geo_location" {
    for_each = var.additional_geo_locations
    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
    }
  }
  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_subnet_ids
    content {
      id = virtual_network_rule.value
    }
  }
  dynamic "capabilities" {
    for_each = var.capabilities
    content {
      name = capabilities.value
    }
  }
  dynamic "customer_managed_key" {
    for_each = var.cmk_key_vault_key_id != null && var.user_assigned_identity_id != null ? [1] : []
    content {
      key_vault_key_id         = var.cmk_key_vault_key_id
      user_assigned_identity_id = var.user_assigned_identity_id
    }
  }
  tags = local.tags
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_cosmosdb_sql_database" "this" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
}

resource "azurerm_private_endpoint" "this" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  private_service_connection {
    name                           = "${var.name}-pe-conn"
    private_connection_resource_id  = azurerm_cosmosdb_account.this.id
    subresource_names              = ["Sql"]
    is_manual_connection           = false
  }
  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "cosmosdb-diag"
  target_resource_id         = azurerm_cosmosdb_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "DataPlaneRequests"
  }
  enabled_log {
    category = "MongoRequests"
  }
  enabled_log {
    category = "ControlPlaneRequests"
  }
  enabled_log {
    category = "QueryRuntimeStatistics"
  }
  enabled_log {
    category = "PartitionKeyRUConsumption"
  }
  enabled_log {
    category = "PartitionKeyStatistics"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_cosmosdb_account.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
