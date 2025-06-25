// Azure API for FHIR module variables.tf

variable "name" {
  description = "The name of the Azure API for FHIR service."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the service will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the service will be hosted."
  type        = string
}

variable "kind" {
  description = "The kind of the Azure API for FHIR service."
  type        = string
}

variable "identity_type" {
  description = "The type of identity used for the service."
  type        = string
}

variable "workspace_id" {
  description = "The ID of the workspace."
  type        = string
}

variable "authentication" {
  description = "Authentication settings for the service."
  type        = any
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace."
  type        = string
}
