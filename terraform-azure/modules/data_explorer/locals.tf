// data_explorer locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "data_explorer"
  }, var.tags)
}
