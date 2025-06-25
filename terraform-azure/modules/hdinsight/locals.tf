// hdinsight locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "hdinsight"
  }, var.tags)
}
