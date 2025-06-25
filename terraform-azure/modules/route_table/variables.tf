variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "routes" {
  type    = list(any)
  default = []
}
variable "tags" { type = map(string) }
