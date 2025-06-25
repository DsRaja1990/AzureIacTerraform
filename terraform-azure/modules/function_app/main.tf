resource "azurerm_function_app" "this" {
  name                       = local.funcapp_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                    = var.runtime_version
  os_type                    = var.os_type
  https_only                 = true
  identity {
    type = "SystemAssigned"
  }
  app_settings               = var.app_settings
  site_config {
    ftps_state      = "FtpsOnly"
    min_tls_version = "1.2"
  }
  tags = local.tags
}

resource "azurerm_private_endpoint" "this" {
  name                = local.pe_name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  private_service_connection {
    name                           = "${local.pe_name}-conn"
    private_connection_resource_id  = azurerm_function_app.this.id
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
