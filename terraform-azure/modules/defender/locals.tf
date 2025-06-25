// defender locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "defender"
  }, var.pricing_tiers)
}
