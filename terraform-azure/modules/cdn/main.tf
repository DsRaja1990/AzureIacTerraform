// Azure CDN module main.tf

resource "azurerm_cdn_profile" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  tags                = var.tags
}

resource "azurerm_cdn_endpoint" "this" {
  name                = var.endpoint_name
  profile_name        = azurerm_cdn_profile.this.name
  resource_group_name = var.resource_group_name
  location            = var.location
  is_http_allowed     = var.is_http_allowed
  is_https_allowed    = var.is_https_allowed
  origin_host_header  = var.origin_host_header
  origin {
    name      = var.origin_name
    host_name = var.origin_host_name
    http_port = var.origin_http_port
    https_port = var.origin_https_port
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "cdn-diagnostics"
  target_resource_id         = azurerm_cdn_profile.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AllLogs"
  }
}
