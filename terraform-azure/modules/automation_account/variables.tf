// Azure Automation Account module variables.tf

variable "name" {
  description = "The name of the Automation Account."
  type        = string
}

variable "location" {
  description = "The Azure region where the Automation Account will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Automation Account will be created."
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Automation Account."
  type        = string
}

variable "identity_type" {
  description = "The identity type of the Automation Account."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Automation Account."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace linked to the Automation Account."
  type        = string
}
