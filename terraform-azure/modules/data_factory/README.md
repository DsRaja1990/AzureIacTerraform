# Data Factory Module

This module provisions a production-ready Azure Data Factory with secure defaults, diagnostics, managed identity, and full parameterization.

## Usage Example
```hcl
module "data_factory" {
  source                  = "./modules/data_factory"
  name                    = var.data_factory_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags                    = local.tags
}
```

## Outputs
- `data_factory_id`   : Data Factory resource ID
- `data_factory_name` : Data Factory name
