// stream_analytics variables.tf

variable "name" {
  description = "The name of the Stream Analytics job."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy to."
  type        = string
}

variable "compatibility_level" {
  description = "The compatibility level of the job."
  type        = string
  default     = "1.2"
}

variable "data_locale" {
  description = "The data locale for the job."
  type        = string
  default     = "en-US"
}

variable "events_out_of_order_policy" {
  description = "The out of order policy."
  type        = string
  default     = "Adjust"
}

variable "events_out_of_order_max_delay_in_seconds" {
  description = "Max delay in seconds for out of order events."
  type        = number
  default     = 0
}

variable "output_error_policy" {
  description = "The output error policy."
  type        = string
  default     = "Drop"
}

variable "streaming_units" {
  description = "The number of streaming units."
  type        = number
  default     = 1
}

variable "transformation_query" {
  description = "The query to run for the transformation."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The Log Analytics workspace ID for diagnostics."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
