resource "azurerm_linux_virtual_machine_scale_set" "this" {
  name                = local.vmss_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  instances           = var.instances
  admin_username      = var.admin_username
  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
    disk_encryption_set_id = var.disk_encryption_set_id
  }
  identity {
    type = var.identity_type
  }
  custom_data = var.custom_data
  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_sa_uri
  }
  network_interface {
    name    = "nic"
    primary = true
    ip_configuration {
      name      = "ipconfig"
      subnet_id = var.subnet_id
    }
  }
  tags = local.tags
}

resource "azurerm_monitor_autoscale_setting" "this" {
  count = var.enable_autoscale ? 1 : 0
  name                = "${local.vmss_name}-autoscale"
  resource_group_name = var.resource_group_name
  location            = var.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.this.id
  profile {
    name = "default"
    capacity {
      minimum = var.autoscale_min
      maximum = var.autoscale_max
      default = var.autoscale_default
    }
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.this.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = var.autoscale_cpu_threshold
      }
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.this.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = var.autoscale_cpu_threshold_down
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = "${local.vmss_name}-diag"
  target_resource_id         = azurerm_linux_virtual_machine_scale_set.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category = "AuditLogs"
  }
}
