// alerts variables.tf

variable "action_group_name" {
  type = string
}
variable "action_group_short_name" {
  type = string
}
variable "email_receiver_name" {
  type = string
}
variable "email_receiver_address" {
  type = string
}
variable "metric_alert_name" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "metric_alert_scopes" {
  type = list(string)
}
variable "metric_alert_description" {
  type    = string
  default = ""
}
variable "metric_alert_severity" {
  type    = number
  default = 3
}
variable "metric_alert_enabled" {
  type    = bool
  default = true
}
variable "metric_alert_frequency" {
  type    = string
  default = "PT1M"
}
variable "metric_alert_window_size" {
  type    = string
  default = "PT5M"
}
variable "metric_namespace" {
  type = string
}
variable "metric_name" {
  type = string
}
variable "aggregation" {
  type = string
}
variable "operator" {
  type = string
}
variable "threshold" {
  type = number
}
variable "rbac_assignments" {
  type = list(object({
    role_definition_name = string
    principal_id         = string
  }))
  default = []
}
variable "tags" {
  type    = map(string)
  default = {}
}
