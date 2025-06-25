# Azure Container Instance Module

This module provisions a production-ready Azure Container Instance (ACI) with secure defaults, diagnostics, managed identity, and full parameterization.

## Usage Example
```hcl
module "container_instance" {
  source                    = "./modules/container_instance"
  name                      = "my-aci"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  os_type                   = "Linux"
  ip_address_type           = "Public"
  dns_name_label            = null
  restart_policy            = "Always"
  container_name            = "mycontainer"
  image                     = "nginx:latest"
  cpu                       = 1
  memory                    = 1.5
  port                      = 80
  protocol                  = "TCP"
  environment_variables     = {}
  secure_environment_variables = {}
  commands                  = []
  log_analytics_workspace_id = var.log_analytics_workspace_id
  log_analytics_workspace_key = var.log_analytics_workspace_key
  tags                      = local.tags
}
```

## Outputs
- `container_group_id`   : Container group resource ID
- `container_group_name` : Container group name
