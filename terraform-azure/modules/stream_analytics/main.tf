terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

resource "azurerm_stream_analytics_job" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = local.tags
  compatibility_level = var.compatibility_level
  data_locale         = var.data_locale
  events_out_of_order_policy = var.events_out_of_order_policy
  events_out_of_order_max_delay_in_seconds = var.events_out_of_order_max_delay_in_seconds
  output_error_policy = var.output_error_policy
  streaming_units     = var.streaming_units
  transformation_query = var.transformation_query
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "streamanalytics-diag"
  target_resource_id         = azurerm_stream_analytics_job.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AllLogs"
  }
}
