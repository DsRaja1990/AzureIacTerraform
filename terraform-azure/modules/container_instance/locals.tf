locals {
  tags = merge({
    environment = terraform.workspace,
    module      = "container_instance"
  }, var.tags)
}
