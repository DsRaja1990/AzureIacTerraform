variable "name" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "sku" {
  type    = string
  default = "standard"
}
variable "public_network_access" {
  type    = string
  default = "Enabled"
}
variable "tags" {
  type    = map(string)
  default = {}
}
