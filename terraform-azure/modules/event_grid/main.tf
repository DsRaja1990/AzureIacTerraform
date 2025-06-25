terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_eventgrid_topic" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.tags
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_eventgrid_topic_authorization_rule" "this" {
  name                = "defaultSendRule"
  eventgrid_topic_name = azurerm_eventgrid_topic.this.name
  resource_group_name = var.resource_group_name
  rights              = ["Send"]
}

resource "azurerm_private_endpoint" "this" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = "${var.name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_subnet_id

  private_service_connection {
    name                           = "${var.name}-pe-conn"
    private_connection_resource_id = azurerm_eventgrid_topic.this.id
    subresource_names              = ["topic"]
    is_manual_connection           = false
  }

  tags = local.tags
}

resource "azurerm_private_dns_a_record" "this" {
  count               = var.enable_private_endpoint && var.private_dns_zone_id != null ? 1 : 0
  name                = azurerm_eventgrid_topic.this.name
  zone_name           = var.private_dns_zone_name
  resource_group_name = var.private_dns_zone_rg
  ttl                 = 300
  records             = [azurerm_private_endpoint.this[0].private_service_connection[0].private_ip_address]
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "eventgrid-diag"
  target_resource_id         = azurerm_eventgrid_topic.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AllLogs"
  }
}
