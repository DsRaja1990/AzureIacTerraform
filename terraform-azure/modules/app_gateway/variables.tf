variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }

variable "sku_name" {
  type    = string
  default = "Standard_v2"
}

variable "sku_tier" {
  type    = string
  default = "Standard_v2"
}

variable "sku_capacity" {
  type    = number
  default = 2
}

variable "subnet_id" { type = string }
variable "public_ip_address_id" { type = string }

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_fqdns" {
  type    = list(string)
  default = []
}

variable "backend_port" {
  type    = number
  default = 80
}

variable "backend_protocol" {
  type    = string
  default = "Http"
}

variable "listener_protocol" {
  type    = string
  default = "Http"
}

variable "tags" { type = map(string) }
