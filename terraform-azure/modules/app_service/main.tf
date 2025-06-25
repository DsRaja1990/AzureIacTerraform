resource "azurerm_app_service_plan" "this" {
  name                = local.asp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.kind
  reserved            = var.reserved
  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
  tags = local.tags
}

resource "azurerm_app_service" "this" {
  name                = local.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.this.id
  https_only          = true
  identity {
    type = var.identity_type
  }
  site_config {
    always_on        = true
    ftps_state       = "FtpsOnly"
    min_tls_version  = "1.2"
    cors {
      allowed_origins     = var.cors_allowed_origins
      support_credentials = var.cors_support_credentials
    }
    ip_restriction = var.ip_restriction
    scm_ip_restriction = var.scm_ip_restriction
  }
  auth_settings {
    enabled         = var.auth_enabled
    default_provider = var.auth_default_provider
    issuer           = var.auth_issuer
  }
  backup {
    name                = "${local.app_name}-backup"
    storage_account_url = var.backup_storage_account_url
    schedule {
      frequency_interval = var.backup_frequency_interval
      frequency_unit     = var.backup_frequency_unit
      keep_at_least_one_backup = true
      retention_period_in_days = var.backup_retention_days
    }
  }
  tags = local.tags
}

resource "azurerm_app_service_slot" "this" {
  count               = var.enable_slot ? 1 : 0
  name                = var.slot_name
  location            = var.location
  app_service_name    = azurerm_app_service.this.name
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.this.id
  site_config {
    always_on        = true
    ftps_state       = "FtpsOnly"
    min_tls_version  = "1.2"
  }
  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.app_name}-diag"
  target_resource_id         = azurerm_app_service.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AppServiceHTTPLogs"
  }
  enabled_log {
    category = "AppServiceConsoleLogs"
  }
  enabled_log {
    category = "AppServiceAppLogs"
  }
  enabled_log {
    category = "AppServiceAuditLogs"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_app_service.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}

resource "azurerm_private_endpoint" "this" {
  name                = local.pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "${local.pe_name}-conn"
    private_connection_resource_id  = azurerm_app_service.this.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
  tags = local.tags
}

resource "azurerm_private_dns_zone" "this" {
  name                = "privatelink.azurewebsites.net"
  resource_group_name = var.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = "${local.pe_name}-vnet-link"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = var.vnet_id
  registration_enabled  = false
  tags                  = local.tags
}

resource "azurerm_private_dns_a_record" "this" {
  name                = local.app_name
  zone_name           = azurerm_private_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = 300
  records             = [azurerm_app_service.this.default_site_hostname]
}
