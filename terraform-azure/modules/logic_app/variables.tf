variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "definition" { type = string }
variable "parameters" {
  type    = map(any)
  default = {}
}
variable "tags" { type = map(string) }
