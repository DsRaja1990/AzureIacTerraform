// defender main.tf

resource "azurerm_security_center_subscription_pricing" "this" {
  for_each = var.pricing_tiers
  tier     = each.value
  resource_type = each.key
}

resource "azurerm_security_center_contact" "this" {
  count      = var.security_contacts != null ? length(var.security_contacts) : 0
  name       = var.security_contacts[count.index].name
  email      = var.security_contacts[count.index].email
  phone      = var.security_contacts[count.index].phone
  alert_notifications = var.security_contacts[count.index].alert_notifications
  alerts_to_admins    = var.security_contacts[count.index].alerts_to_admins
}

resource "azurerm_security_center_auto_provisioning" "this" {
  auto_provision = var.auto_provision
}
