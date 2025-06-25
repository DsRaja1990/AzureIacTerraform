resource "azurerm_application_gateway" "this" {
  name                = local.appgw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }
  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id
  }
  frontend_port {
    name = "frontendPort"
    port = var.frontend_port
  }
  frontend_ip_configuration {
    name                 = "frontendIpConfig"
    public_ip_address_id = var.public_ip_address_id
  }
  backend_address_pool {
    name  = "backendPool"
    fqdns = var.backend_fqdns
  }
  backend_http_settings {
    name                  = "httpSettings"
    port                  = var.backend_port
    protocol              = var.backend_protocol
    cookie_based_affinity = "Disabled"
  }
  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "frontendIpConfig"
    frontend_port_name             = "frontendPort"
    protocol                       = var.listener_protocol
  }
  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "backendPool"
    backend_http_settings_name = "httpSettings"
  }
  tags = local.tags
}
