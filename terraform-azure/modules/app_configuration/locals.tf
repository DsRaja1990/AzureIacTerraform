locals {
  tags = merge({
    environment = terraform.workspace,
    module      = "app_configuration"
  }, var.tags)
}
