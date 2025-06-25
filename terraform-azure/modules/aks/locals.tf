locals {
  tags = merge({
    environment = terraform.workspace,
    module      = "aks"
  }, var.tags)
}
