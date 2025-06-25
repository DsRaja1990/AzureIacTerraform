locals {
  ehns_name = "${var.naming_prefix}-ehns"
  eh_name   = "${var.naming_prefix}-eh"
  consumer_group_name = "${var.naming_prefix}-cg"
  auth_rule_name = "${var.naming_prefix}-ns-auth"
  eh_auth_rule_name = "${var.naming_prefix}-eh-auth"
  tags      = merge(var.tags, { module = "event_hub" })
}
