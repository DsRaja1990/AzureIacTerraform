resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name
  purge_protection_enabled    = true
  enable_rbac_authorization   = var.enable_rbac_authorization
  public_network_access_enabled = false
  network_acls {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
  tags = local.tags
  dynamic "customer_managed_key" {
    for_each = var.cmk_key_vault_key_id != null && var.user_assigned_identity_id != null ? [1] : []
    content {
      key_vault_key_id         = var.cmk_key_vault_key_id
      user_assigned_identity_id = var.user_assigned_identity_id
    }
  }
}

resource "azurerm_key_vault_access_policy" "this" {
  count               = length(var.access_policies)
  key_vault_id        = azurerm_key_vault.this.id
  tenant_id           = var.access_policies[count.index].tenant_id
  object_id           = var.access_policies[count.index].object_id
  key_permissions     = var.access_policies[count.index].key_permissions
  secret_permissions  = var.access_policies[count.index].secret_permissions
  certificate_permissions = var.access_policies[count.index].certificate_permissions
  storage_permissions = var.access_policies[count.index].storage_permissions
}

resource "azurerm_private_endpoint" "this" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = "${var.key_vault_name}-pe"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint_subnet_id
  private_service_connection {
    name                           = "${var.key_vault_name}-pe-conn"
    private_connection_resource_id  = azurerm_key_vault.this.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }
  tags = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${var.key_vault_name}-diag"
  target_resource_id         = azurerm_key_vault.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditEvent"
  }
}
