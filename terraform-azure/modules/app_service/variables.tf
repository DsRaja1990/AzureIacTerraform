variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "vnet_id" { type = string }
variable "subnet_id" { type = string }

variable "kind" {
  type    = string
  default = "Linux"
}

variable "reserved" {
  type    = bool
  default = true
}

variable "sku_tier" {
  type    = string
  default = "Standard"
}

variable "sku_size" {
  type    = string
  default = "S1"
}

variable "tags" { type = map(string) }

variable "identity_type" {
  type    = string
  default = "SystemAssigned"
}
variable "cors_allowed_origins" {
  type    = list(string)
  default = []
}
variable "cors_support_credentials" {
  type    = bool
  default = false
}
variable "ip_restriction" {
  type    = list(any)
  default = []
}
variable "scm_ip_restriction" {
  type    = list(any)
  default = []
}
variable "auth_enabled" {
  type    = bool
  default = false
}
variable "auth_default_provider" {
  type    = string
  default = null
}
variable "auth_issuer" {
  type    = string
  default = null
}
variable "backup_storage_account_url" {
  type    = string
  default = null
}
variable "backup_frequency_interval" {
  type    = number
  default = 7
}
variable "backup_frequency_unit" {
  type    = string
  default = "Day"
}
variable "backup_retention_days" {
  type    = number
  default = 30
}
variable "enable_slot" {
  type    = bool
  default = false
}
variable "slot_name" {
  type    = string
  default = null
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}
variable "rbac_assignments" {
  type = list(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = []
}
