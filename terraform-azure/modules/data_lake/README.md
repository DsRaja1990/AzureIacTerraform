# Data Lake Module

This module provisions a production-ready Azure Data Lake Storage Gen2 account with secure defaults, diagnostics, managed identity, and full parameterization.

## Usage Example
```hcl
module "data_lake" {
  source                  = "./modules/data_lake"
  name                    = var.data_lake_name
  resource_group_name     = var.resource_group_name
  location                = var.location
  account_tier            = "Standard"
  account_replication_type = "LRS"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags                    = local.tags
}
```

## Outputs
- `data_lake_storage_account_id`      : Data Lake Storage Account resource ID
- `data_lake_storage_account_name`    : Data Lake Storage Account name
- `data_lake_primary_dfs_endpoint`    : Data Lake primary DFS endpoint
