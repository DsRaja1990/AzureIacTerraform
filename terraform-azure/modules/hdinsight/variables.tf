// hdinsight variables.tf

variable "cluster_name" {
  description = "The name of the HDInsight cluster."
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

variable "cluster_version" {
  description = "The HDInsight cluster version."
  type        = string
  default     = "4.0"
}

variable "tier" {
  description = "The cluster tier (Standard or Premium)."
  type        = string
  default     = "Standard"
}

variable "component_version" {
  description = "A map of component versions."
  type        = map(string)
  default     = {}
}

variable "gateway_username" {
  description = "The username for the gateway."
  type        = string
}

variable "gateway_password" {
  description = "The password for the gateway."
  type        = string
  sensitive   = true
}

variable "head_node_vm_size" {
  description = "The VM size for the head node."
  type        = string
  default     = "Standard_D3_V2"
}

variable "head_node_username" {
  description = "The username for the head node."
  type        = string
}

variable "head_node_password" {
  description = "The password for the head node."
  type        = string
  sensitive   = true
}

variable "worker_node_vm_size" {
  description = "The VM size for the worker node."
  type        = string
  default     = "Standard_D3_V2"
}

variable "worker_node_username" {
  description = "The username for the worker node."
  type        = string
}

variable "worker_node_password" {
  description = "The password for the worker node."
  type        = string
  sensitive   = true
}

variable "worker_node_count" {
  description = "The number of worker nodes."
  type        = number
  default     = 2
}

variable "zookeeper_node_vm_size" {
  description = "The VM size for the zookeeper node."
  type        = string
  default     = "Standard_D3_V2"
}

variable "zookeeper_node_username" {
  description = "The username for the zookeeper node."
  type        = string
}

variable "zookeeper_node_password" {
  description = "The password for the zookeeper node."
  type        = string
  sensitive   = true
}

variable "storage_account_key" {
  description = "The key for the storage account."
  type        = string
  sensitive   = true
}

variable "storage_container_id" {
  description = "The ID of the storage container."
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
