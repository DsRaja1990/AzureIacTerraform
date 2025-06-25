// data_factory locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "data_factory"
  }, var.tags)
}
