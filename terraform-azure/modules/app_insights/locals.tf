// app_insights locals.tf
locals {
  tags = var.tags != null ? var.tags : {}
}