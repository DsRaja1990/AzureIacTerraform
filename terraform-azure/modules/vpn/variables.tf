// Azure VPN module variables.tf

variable "name" {
  description = "The name of the VPN Gateway."
  type        = string
}

variable "location" {
  description = "The Azure region where the VPN Gateway will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the VPN Gateway will be created."
  type        = string
}

variable "virtual_hub_id" {
  description = "The ID of the virtual hub that the VPN Gateway will be associated with."
  type        = string
}

variable "bgp_asn" {
  description = "The BGP Autonomous System Number (ASN) for the VPN Gateway."
  type        = number
}

variable "peer_weight" {
  description = "The weight of the VPN Gateway in the BGP configuration."
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the VPN Gateway resource."
  type        = map(string)
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for logging and monitoring."
  type        = string
}
