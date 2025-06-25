locals {
  bastion_name = "${var.naming_prefix}-bastion"
  tags         = merge(var.tags, { module = "bastion" })
}
