variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "type" {
  type    = string
  default = "Vpn"
}

variable "vpn_type" {
  type    = string
  default = "RouteBased"
}

variable "active_active" {
  type    = bool
  default = false
}

variable "enable_bgp" {
  type    = bool
  default = false
}

variable "sku" {
  type    = string
  default = "VpnGw1"
}

variable "public_ip_address_id" { type = string }
variable "subnet_id" { type = string }
variable "tags" { type = map(string) }
