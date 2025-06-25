// storage_queue locals.tf

locals {
  tags = merge({
    environment = "${terraform.workspace}"
    module      = "storage_queue"
  }, var.tags)
}
