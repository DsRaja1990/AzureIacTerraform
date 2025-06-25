# Cosmos DB Module

This module provisions a production-ready Azure Cosmos DB account with advanced features, secure defaults, private endpoint, diagnostics, RBAC, and full parameterization.

## Usage Example
```hcl
module "cosmosdb" {
  source                     = "./modules/cosmosdb"
  name                       = var.cosmosdb_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  offer_type                 = "Standard"
  kind                       = "GlobalDocumentDB"
  enable_automatic_failover  = true
  consistency_level          = "Session"
  max_interval_in_seconds    = 5
  max_staleness_prefix       = 100
  is_virtual_network_filter_enabled = true
  public_network_access_enabled     = false
  database_name              = var.database_name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags                       = local.tags
  additional_geo_locations   = []
  virtual_network_subnet_ids = []
  capabilities               = []
  cmk_key_vault_key_id       = null
  user_assigned_identity_id  = null
  enable_private_endpoint    = true
  private_endpoint_subnet_id = var.private_endpoint_subnet_id
  rbac_assignments           = []
}
```

## Outputs
- `cosmosdb_account_id`           : Cosmos DB account resource ID
- `cosmosdb_account_name`         : Cosmos DB account name
- `cosmosdb_account_endpoint`     : Cosmos DB endpoint URL
- `cosmosdb_sql_database_id`      : SQL database resource ID
- `cosmosdb_sql_database_name`    : SQL database name
- `private_endpoint_id`           : Private endpoint resource ID (if enabled)
