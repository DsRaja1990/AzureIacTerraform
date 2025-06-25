variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "sku" {
  type    = string
  default = "Standard"
}
variable "public_ip_address_id" { type = string }
variable "subnet_id" { type = string }
variable "protocol" {
  type    = string
  default = "Tcp"
}
variable "frontend_port" {
  type    = number
  default = 80
}
variable "backend_port" {
  type    = number
  default = 80
}
variable "tags" { type = map(string) }
