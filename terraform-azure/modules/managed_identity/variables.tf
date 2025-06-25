// managed_identity variables.tf

variable "name" {
  description = "The name of the managed identity."
  type        = string
}

variable "location" {
  description = "The location where the managed identity should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the managed identity will be created."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the managed identity."
  type        = map(string)
}
