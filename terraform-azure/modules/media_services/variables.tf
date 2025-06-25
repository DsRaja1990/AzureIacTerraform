// Azure Media Services module variables.tf

variable "name" {
  description = "The name of the Media Services account."
  type        = string
}

variable "location" {
  description = "The Azure region where the Media Services account will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Media Services account will be created."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the storage account associated with the Media Services account."
  type        = string
}

variable "identity_type" {
  description = "The type of identity used for the Media Services account."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Media Services account."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for monitoring and logging."
  type        = string
}
