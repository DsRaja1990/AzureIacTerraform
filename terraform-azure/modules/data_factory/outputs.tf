// data_factory outputs.tf

output "data_factory_id" {
  value = azurerm_data_factory.this.id
}

output "data_factory_name" {
  value = azurerm_data_factory.this.name
}
