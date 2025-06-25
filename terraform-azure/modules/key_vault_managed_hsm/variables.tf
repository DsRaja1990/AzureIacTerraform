// Azure Key Vault Managed HSM module variables.tf

variable "name" {
  description = "The name of the Key Vault Managed HSM."
  type        = string
}

variable "location" {
  description = "The Azure region where the Key Vault Managed HSM should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Key Vault Managed HSM should be created."
  type        = string
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Key Vault Managed HSM."
  type        = string
}

variable "admin_object_ids" {
  description = "A list of Azure Active Directory object IDs that will be assigned as administrators of the Key Vault Managed HSM."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault Managed HSM."
  type        = map(string)
}
