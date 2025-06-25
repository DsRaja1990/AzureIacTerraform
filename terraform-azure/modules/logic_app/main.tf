resource "azurerm_logic_app_workflow" "this" {
  name                = local.logicapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  parameters          = var.parameters
  tags                = local.tags
}
