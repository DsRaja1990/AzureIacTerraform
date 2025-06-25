// data_lake outputs.tf

output "data_lake_storage_account_id" {
  value = azurerm_storage_account.this.id
}

output "data_lake_storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "data_lake_primary_dfs_endpoint" {
  value = azurerm_storage_account.this.primary_dfs_endpoint
}
