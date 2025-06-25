variable "naming_prefix" { type = string }
variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "sku_tier" {
  type    = string
  default = "Standard"
}
variable "repository_url" { type = string }
variable "branch" {
  type    = string
  default = "main"
}
variable "app_location" {
  type    = string
  default = "/"
}
variable "api_location" {
  type    = string
  default = "api"
}
variable "output_location" {
  type    = string
  default = "build"
}
variable "tags" { type = map(string) }
