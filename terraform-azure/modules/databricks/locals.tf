// databricks locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "databricks"
  }, var.tags)
}
