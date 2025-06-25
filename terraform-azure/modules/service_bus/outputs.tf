output "servicebus_namespace_id" {
  value = azurerm_servicebus_namespace.this.id
}
output "servicebus_queue_id" {
  value = azurerm_servicebus_queue.this.id
}
