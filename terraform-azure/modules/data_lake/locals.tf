// data_lake locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "data_lake"
  }, var.tags)
}
