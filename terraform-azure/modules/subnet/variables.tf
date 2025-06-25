variable "naming_prefix" { type = string }
variable "resource_group_name" { type = string }
variable "virtual_network_name" { type = string }
variable "address_prefixes" { type = list(string) }
variable "service_endpoints" {
  type    = list(string)
  default = []
}
variable "delegation" {
  type    = any
  default = null
}
