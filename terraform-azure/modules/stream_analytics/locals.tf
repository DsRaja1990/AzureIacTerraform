// stream_analytics locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "stream_analytics"
  }, var.tags)
}
