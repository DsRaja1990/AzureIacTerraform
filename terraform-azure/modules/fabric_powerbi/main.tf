// fabric_powerbi main.tf

resource "azurerm_fabric_powerbi" "this" {
  name                = var.name
  workspace_id        = var.workspace_id
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
