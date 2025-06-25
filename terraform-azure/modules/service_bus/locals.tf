locals {
  sb_name     = "${var.naming_prefix}-sb"
  queue_name  = "${var.naming_prefix}-queue"
  topic_name  = "${var.naming_prefix}-topic"
  subscription_name = "${var.naming_prefix}-sub"
  tags        = merge(var.tags, { module = "service_bus" })
}
