locals {
  image_name = "${var.naming_prefix}-image"
  tags       = merge(var.tags, { module = "image" })
}
