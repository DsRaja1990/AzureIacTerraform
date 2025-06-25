# Databricks Module

This module provisions a production-ready Azure Databricks workspace with secure defaults, diagnostics, managed identity, and full parameterization.

## Usage Example
```hcl
module "databricks" {
  source                        = "./modules/databricks"
  name                          = var.databricks_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = "premium"
  managed_resource_group_name   = var.managed_resource_group_name
  no_public_ip                  = true
  log_analytics_workspace_id    = var.log_analytics_workspace_id
  tags                          = local.tags
}
```

## Outputs
- `databricks_workspace_id`            : Databricks workspace resource ID
- `databricks_workspace_name`          : Databricks workspace name
- `databricks_workspace_url`           : Databricks workspace URL
- `databricks_managed_resource_group`  : Managed resource group name
