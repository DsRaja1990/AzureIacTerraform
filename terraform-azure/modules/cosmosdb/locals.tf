// cosmosdb locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "cosmosdb"
  }, var.tags)
}
