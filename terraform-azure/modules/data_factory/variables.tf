// data_factory variables.tf

variable "name" {
  description = "The name of the Data Factory."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
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
