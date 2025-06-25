// defender variables.tf

variable "pricing_tiers" {
  description = "Map of resource types to Defender pricing tiers (e.g., { VirtualMachines = \"Standard\" })"
  type        = map(string)
  default     = {
    VirtualMachines = "Standard"
    SqlServers     = "Standard"
    AppServices    = "Standard"
    StorageAccounts = "Standard"
    KubernetesService = "Standard"
  }
}

variable "security_contacts" {
  description = "List of security contacts for Defender notifications."
  type = list(object({
    name                = string
    email               = string
    phone               = string
    alert_notifications = bool
    alerts_to_admins    = bool
  }))
  default = []
}

variable "auto_provision" {
  description = "Enable auto-provisioning of the Log Analytics agent."
  type        = string
  default     = "On"
}
