// defender outputs.tf

output "defender_pricing_tiers" {
  value = var.pricing_tiers
}

output "defender_security_contacts" {
  value = var.security_contacts
}

output "defender_auto_provision" {
  value = var.auto_provision
}
