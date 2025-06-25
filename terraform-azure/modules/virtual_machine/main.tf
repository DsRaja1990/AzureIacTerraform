resource "azurerm_linux_virtual_machine" "this" {
  name                = local.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.size
  admin_username      = var.admin_username
  network_interface_ids = [var.network_interface_id]
  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
    disk_encryption_set_id = var.disk_encryption_set_id
  }
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  identity {
    type = var.identity_type
  }
  custom_data = var.custom_data
  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_sa_uri
  }
  tags = local.tags
}

resource "azurerm_virtual_machine_extension" "custom" {
  count                = length(var.extensions)
  name                 = var.extensions[count.index].name
  virtual_machine_id   = azurerm_linux_virtual_machine.this.id
  publisher            = var.extensions[count.index].publisher
  type                 = var.extensions[count.index].type
  type_handler_version = var.extensions[count.index].type_handler_version
  settings             = var.extensions[count.index].settings
  protected_settings   = var.extensions[count.index].protected_settings
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.vm_name}-diag"
  target_resource_id         = azurerm_linux_virtual_machine.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}

resource "azurerm_dev_test_global_vm_shutdown_schedule" "this" {
  count                 = var.enable_auto_shutdown ? 1 : 0
  virtual_machine_id    = azurerm_linux_virtual_machine.this.id
  location              = var.location
  enabled               = true
  daily_recurrence_time = var.auto_shutdown_time
  timezone              = var.auto_shutdown_timezone
  notification_settings {
    enabled         = var.auto_shutdown_notification_enabled
    email           = var.auto_shutdown_notification_email
    webhook_url     = var.auto_shutdown_notification_webhook
  }
}
