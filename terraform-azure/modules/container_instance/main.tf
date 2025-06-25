terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

resource "azurerm_container_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type
  ip_address_type     = var.ip_address_type
  dns_name_label      = var.dns_name_label
  restart_policy      = var.restart_policy
  tags                = local.tags

  container {
    name   = var.container_name
    image  = var.image
    cpu    = var.cpu
    memory = var.memory
    ports {
      port     = var.port
      protocol = var.protocol
    }
    environment_variables = var.environment_variables
    secure_environment_variables = var.secure_environment_variables
    commands = var.commands
  }

  diagnostics {
    log_analytics {
      workspace_id = var.log_analytics_workspace_id
      workspace_key = var.log_analytics_workspace_key
    }
  }
  identity {
    type = "SystemAssigned"
  }
}
