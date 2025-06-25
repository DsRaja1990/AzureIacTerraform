// synapse locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "synapse"
  }, var.tags)
}
