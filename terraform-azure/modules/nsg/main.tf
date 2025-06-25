resource "azurerm_network_security_group" "this" {
  name                = local.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  security_rule       = var.security_rules
  tags                = local.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.nsg_name}-diag"
  target_resource_id         = azurerm_network_security_group.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "NetworkSecurityGroupEvent"
  }
  enabled_log {
    category = "NetworkSecurityGroupRuleCounter"
  }
}

resource "azurerm_role_assignment" "this" {
  count                = length(var.rbac_assignments)
  scope                = azurerm_network_security_group.this.id
  role_definition_name = var.rbac_assignments[count.index].role_definition_name
  principal_id         = var.rbac_assignments[count.index].principal_id
}
