// purview locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "purview"
  }, var.tags)
}
