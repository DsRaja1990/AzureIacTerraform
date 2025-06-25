// event_grid locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "event_grid"
  }, var.tags)
}
