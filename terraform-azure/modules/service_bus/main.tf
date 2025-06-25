resource "azurerm_servicebus_namespace" "this" {
  name                = local.sb_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  tags                = local.tags
}

resource "azurerm_servicebus_queue" "this" {
  name                = local.queue_name
  namespace_id        = azurerm_servicebus_namespace.this.id
  max_size_in_megabytes = var.max_size_in_megabytes
}

resource "azurerm_servicebus_topic" "this" {
  name                = local.topic_name
  namespace_id        = azurerm_servicebus_namespace.this.id
  max_size_in_megabytes = var.max_size_in_megabytes
}

resource "azurerm_servicebus_subscription" "this" {
  name                = local.subscription_name
  topic_id            = azurerm_servicebus_topic.this.id
  max_delivery_count  = var.max_delivery_count
}
