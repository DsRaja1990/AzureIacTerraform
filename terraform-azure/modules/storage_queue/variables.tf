// storage_queue variables.tf

variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "account_tier" {
  description = "The storage account tier (Standard or Premium)."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)."
  type        = string
  default     = "LRS"
}

variable "queue_name" {
  description = "The name of the Storage Queue."
  type        = string
}

variable "enable_private_endpoint" {
  description = "Whether to enable a private endpoint."
  type        = bool
  default     = false
}

variable "private_subnet_id" {
  description = "The subnet ID for the private endpoint."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "The private DNS zone ID for the private endpoint."
  type        = string
  default     = null
}

variable "private_dns_zone_name" {
  description = "The private DNS zone name."
  type        = string
  default     = null
}

variable "private_dns_zone_rg" {
  description = "The resource group for the private DNS zone."
  type        = string
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "The Log Analytics workspace ID for diagnostics."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
