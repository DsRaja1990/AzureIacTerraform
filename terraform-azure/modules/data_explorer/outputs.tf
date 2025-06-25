// data_explorer outputs.tf

output "kusto_cluster_id" {
  value = azurerm_kusto_cluster.this.id
}

output "kusto_cluster_name" {
  value = azurerm_kusto_cluster.this.name
}

output "kusto_database_id" {
  value = azurerm_kusto_database.this.id
}

output "kusto_database_name" {
  value = azurerm_kusto_database.this.name
}
