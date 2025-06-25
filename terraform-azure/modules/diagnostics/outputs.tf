// diagnostics outputs.tf

output "diagnostic_setting_id" {
  value = azurerm_monitor_diagnostic_setting.this.id
}

output "diagnostic_setting_name" {
  value = azurerm_monitor_diagnostic_setting.this.name
}
