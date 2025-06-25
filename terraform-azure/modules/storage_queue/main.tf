// storage_queue main.tf

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = "TLS1_2"
  tags                     = local.tags
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_queue" "this" {
  name                 = var.queue_name
  storage_account_name = azurerm_storage_account.this.name
}

resource "azurerm_private_endpoint" "this" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = "${var.storage_account_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_subnet_id

  private_service_connection {
    name                           = "${var.storage_account_name}-pe-conn"
    private_connection_resource_id = azurerm_storage_account.this.id
    subresource_names              = ["queue"]
    is_manual_connection           = false
  }

  tags = local.tags
}

resource "azurerm_private_dns_a_record" "this" {
  count               = var.enable_private_endpoint && var.private_dns_zone_id != null ? 1 : 0
  name                = azurerm_storage_account.this.name
  zone_name           = var.private_dns_zone_name
  resource_group_name = var.private_dns_zone_rg
  ttl                 = 300
  records             = [azurerm_private_endpoint.this[0].private_service_connection[0].private_ip_address]
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "storagequeue-diag"
  target_resource_id         = azurerm_storage_account.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "StorageRead"
  }
  enabled_log {
    category = "StorageWrite"
  }
  enabled_log {
    category = "StorageDelete"
  }
}
