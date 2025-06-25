# Diagnostics Module

This module provisions Azure Monitor diagnostic settings for any resource, with RBAC support and full parameterization.

## Usage Example
```hcl
module "diagnostics" {
  source                    = "./modules/diagnostics"
  diagnostic_name           = "my-diagnostics"
  target_resource_id        = azurerm_storage_account.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id
  enabled_logs              = ["StorageRead", "StorageWrite", "StorageDelete"]
  metrics                   = ["AllMetrics"]
  rbac_assignments = [
    {
      role_definition_name = "Monitoring Reader"
      principal_id         = "<principal-guid>"
    }
  ]
}
```

## Outputs
- `diagnostic_setting_id`   : Diagnostic setting resource ID
- `diagnostic_setting_name` : Diagnostic setting name
