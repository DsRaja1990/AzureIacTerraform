// Azure Virtual WAN module variables.tf

variable "name" {
  description = "The name of the Virtual WAN."
  type        = string
}

variable "location" {
  description = "The Azure region where the Virtual WAN will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Virtual WAN will be created."
  type        = string
}

variable "type" {
  description = "The type of the Virtual WAN."
  type        = string
}

variable "disable_vpn_encryption" {
  description = "Flag to disable VPN encryption."
  type        = bool
}

variable "office365_local_breakout_category" {
  description = "The Office 365 local breakout category."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Virtual WAN."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}
