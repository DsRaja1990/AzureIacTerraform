// cosmosdb outputs.tf

output "cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.this.id
}

output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.this.name
}

output "cosmosdb_account_endpoint" {
  value = azurerm_cosmosdb_account.this.endpoint
}

output "cosmosdb_sql_database_id" {
  value = azurerm_cosmosdb_sql_database.this.id
}

output "cosmosdb_sql_database_name" {
  value = azurerm_cosmosdb_sql_database.this.name
}

output "private_endpoint_id" {
  value = try(azurerm_private_endpoint.this[0].id, null)
}
