// Azure Site Recovery module variables.tf

variable "name" {
  description = "The name of the Azure Site Recovery resource."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure Site Recovery resource."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the Azure Site Recovery resource."
  type        = string
}

variable "sku" {
  description = "The SKU of the Azure Site Recovery resource."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Azure Site Recovery resource."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace to link with the Azure Site Recovery resource."
  type        = string
}
