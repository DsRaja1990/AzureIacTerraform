# Data Explorer (Kusto) Module

This module provisions a production-ready Azure Data Explorer (Kusto) cluster and database with secure defaults, diagnostics, managed identity, and full parameterization.

## Usage Example
```hcl
module "data_explorer" {
  source                  = "./modules/data_explorer"
  cluster_name            = var.kusto_cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = "Standard_D13_v2"
  sku_capacity            = 2
  database_name           = var.kusto_database_name
  hot_cache_period        = "P7D"
  soft_delete_period      = "P31D"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags                    = local.tags
}
```

## Outputs
- `kusto_cluster_id`      : Kusto cluster resource ID
- `kusto_cluster_name`    : Kusto cluster name
- `kusto_database_id`     : Kusto database resource ID
- `kusto_database_name`   : Kusto database name
