resource "azurerm_lb" "this" {
  name                = local.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = var.public_ip_address_id
    subnet_id            = var.subnet_id
  }
  tags = local.tags
}

resource "azurerm_lb_backend_address_pool" "this" {
  name            = "BackendPool"
  loadbalancer_id = azurerm_lb.this.id
}

resource "azurerm_lb_rule" "this" {
  name                           = "LBRule"
  loadbalancer_id                = azurerm_lb.this.id
  protocol                      = var.protocol
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
}
