variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "service_provider_name" { type = string }
variable "peering_location" { type = string }
variable "bandwidth_in_mbps" { type = number }
variable "sku_tier" {
  type    = string
  default = "Standard"
}

variable "sku_family" {
  type    = string
  default = "MeteredData"
}

variable "tags" { type = map(string) }
