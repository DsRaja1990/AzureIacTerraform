terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

resource "azurerm_frontdoor" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = local.tags

  backend_pool {
    name = var.backend_pool_name
    backend {
      address     = var.backend_address
      host_header = var.backend_host_header
      http_port   = var.backend_http_port
      https_port  = var.backend_https_port
    }
    load_balancing_name = "default-load-balancing"
    health_probe_name   = "default-health-probe"
  }

  backend_pool_health_probe {
    name                = "default-health-probe"
    protocol            = "Https"
    path                = "/"
    interval_in_seconds = 30
  }

  backend_pool_load_balancing {
    name                            = "default-load-balancing"
    sample_size                     = 4
    successful_samples_required      = 2
    additional_latency_milliseconds = 0
  }

  frontend_endpoint {
    name      = var.frontend_endpoint_name
    host_name = var.host_name
  }

  routing_rule {
    name               = var.routing_rule_name
    accepted_protocols = var.accepted_protocols
    patterns_to_match  = var.patterns_to_match
    frontend_endpoints = [var.frontend_endpoint_name]
    forwarding_configuration {
      backend_pool_name = var.backend_pool_name
    }
  }
}

resource "azurerm_frontdoor_frontend_endpoint" "this" {
  name                     = var.frontend_endpoint_name
  frontdoor_name           = azurerm_frontdoor.this.name
  resource_group_name      = var.resource_group_name
  host_name                = var.host_name
}

resource "azurerm_frontdoor_backend_pool" "this" {
  name                = var.backend_pool_name
  resource_group_name = var.resource_group_name
  frontdoor_name      = azurerm_frontdoor.this.name
  backend {
    host_header = var.backend_host_header
    address     = var.backend_address
    http_port   = var.backend_http_port
    https_port  = var.backend_https_port
  }
}
 
// implement region traffic blocking  
// Example: Block traffic from specific country codes (e.g., CN, RU)
resource "azurerm_frontdoor_firewall_policy_custom_rule" "block_regions" {
    name                = "BlockRegions"
    priority            = 1
    action              = "Block"
    rule_type           = "MatchRule"
    frontend_endpoints  = [azurerm_frontdoor_frontend_endpoint.this.id]
    policy_id           = azurerm_frontdoor_firewall_policy.this.id

    match_condition {
        match_variable     = "RemoteAddr"
        operator           = "GeoMatch"
        match_values       = ["CN", "RU"] // Add ISO country codes to block
        negation_condition = false
    }
}

// front door cdn 
resource "azurerm_cdn_profile" "this" {
    name                = "${var.name}-cdn-profile"
    resource_group_name = var.resource_group_name
    location            = var.location
    sku                 = "Standard_Microsoft"
    tags                = local.tags
}

resource "azurerm_cdn_endpoint" "this" {
    name                = "${var.name}-cdn-endpoint"
    profile_name        = azurerm_cdn_profile.this.name
    resource_group_name = var.resource_group_name
    location            = var.location
    origin {
        name      = "frontdoor-origin"
        host_name = azurerm_frontdoor_frontend_endpoint.this.host_name
        https_port = 443
    }
    is_http_allowed  = false
    is_https_allowed = true
    tags             = local.tags
}
