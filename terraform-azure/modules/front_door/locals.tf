locals {
  tags = merge({
    environment = terraform.workspace,
    module      = "front_door"
  }, var.tags)
}
