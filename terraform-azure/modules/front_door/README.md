# Azure Front Door Module

This module provisions a production-ready Azure Front Door with secure defaults, backend pools, routing rules, and full parameterization.

## Usage Example
```hcl
module "front_door" {
  source                    = "./modules/front_door"
  name                      = "my-frontdoor"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  routing_rule_name         = "default-rule"
  accepted_protocols        = ["Https"]
  patterns_to_match         = ["/*"]
  frontend_endpoint_name    = "frontend"
  host_name                 = "myapp.azurefd.net"
  backend_pool_name         = "backendpool"
  backend_host_header       = "myapp.azurewebsites.net"
  backend_address           = "myapp.azurewebsites.net"
  backend_http_port         = 80
  backend_https_port        = 443
  tags                      = local.tags
}
```

## Outputs
- `frontdoor_id`   : Front Door resource ID
- `frontdoor_name` : Front Door name
