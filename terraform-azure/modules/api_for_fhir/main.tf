// Azure API for FHIR module main.tf

resource "azurerm_healthcare_fhir_service" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = var.kind
  identity {
    type = var.identity_type
  }
  workspace_id        = var.workspace_id
  authentication {
    audience             = var.authentication["audience"]
    authority            = var.authentication["authority"]
    smart_proxy_enabled  = var.authentication["smart_proxy_enabled"]
  }
  tags = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "fhir-diagnostics"
  target_resource_id         = azurerm_healthcare_fhir_service.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
