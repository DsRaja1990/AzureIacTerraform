# Defender Module

This module enables Microsoft Defender for Cloud (Azure Security Center) with secure defaults, pricing tiers, security contacts, and auto-provisioning.

## Usage Example
```hcl
module "defender" {
  source          = "./modules/defender"
  pricing_tiers   = {
    VirtualMachines     = "Standard"
    SqlServers          = "Standard"
    AppServices         = "Standard"
    StorageAccounts     = "Standard"
    KubernetesService   = "Standard"
  }
  security_contacts = [
    {
      name                = "SecurityAdmin"
      email               = "admin@example.com"
      phone               = "+1234567890"
      alert_notifications = true
      alerts_to_admins    = true
    }
  ]
  auto_provision = "On"
}
```

## Outputs
- `defender_pricing_tiers`      : Defender pricing tiers
- `defender_security_contacts`  : Security contacts
- `defender_auto_provision`     : Auto-provisioning setting
