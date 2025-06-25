// Azure Key Vault Managed HSM module main.tf

resource "azurerm_key_vault_managed_hardware_security_module" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name
  admin_object_ids    = var.admin_object_ids
  tags                = var.tags
}
