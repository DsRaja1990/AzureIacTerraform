// Azure Peering Service module variables.tf

variable "name" {
  description = "The name of the Azure Peering Service."
  type        = string
}

variable "location" {
  description = "The Azure region where the Peering Service will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Peering Service will be created."
  type        = string
}

variable "peering_service_location" {
  description = "The location of the peering service."
  type        = string
}

variable "peering_service_provider_name" {
  description = "The name of the peering service provider."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}
