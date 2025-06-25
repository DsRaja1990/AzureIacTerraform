// databricks outputs.tf

output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.this.id
}

output "databricks_workspace_name" {
  value = azurerm_databricks_workspace.this.name
}

output "databricks_workspace_url" {
  value = azurerm_databricks_workspace.this.workspace_url
}

output "databricks_managed_resource_group" {
  value = azurerm_databricks_workspace.this.managed_resource_group_name
}
