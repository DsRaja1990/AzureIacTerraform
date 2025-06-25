terraform {
  required_version = ">= 1.6.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

locals {
  naming_prefix = var.naming_prefix
  tags = merge({
    environment = var.environment
    owner       = var.owner
    cost_center = var.cost_center
  }, var.extra_tags)
}

# Virtual Network
module "virtual_network" {
  source              = "./modules/virtual_network"
  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers
  tags                = local.tags
}

# App Service
module "app_service" {
  source              = "./modules/app_service"
  naming_prefix       = var.naming_prefix
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_id             = module.virtual_network.id
  subnet_id           = var.app_service_subnet_id
  kind                = var.app_service_kind
  reserved            = var.app_service_reserved
  sku_tier            = var.app_service_sku_tier
  sku_size            = var.app_service_sku_size
  tags                = local.tags
  identity_type       = var.app_service_identity_type
  cors_allowed_origins = var.app_service_cors_allowed_origins
  cors_support_credentials = var.app_service_cors_support_credentials
  ip_restriction      = var.app_service_ip_restriction
  scm_ip_restriction  = var.app_service_scm_ip_restriction
  auth_enabled        = var.app_service_auth_enabled
  auth_default_provider = var.app_service_auth_default_provider
  auth_issuer         = var.app_service_auth_issuer
}

# Key Vault
module "key_vault" {
  source                      = "./modules/key_vault"
  key_vault_name              = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.key_vault_sku_name
  enable_rbac_authorization   = var.key_vault_enable_rbac_authorization
  ip_rules                    = var.key_vault_ip_rules
  virtual_network_subnet_ids  = var.key_vault_virtual_network_subnet_ids
  access_policies             = var.key_vault_access_policies
  enable_private_endpoint     = var.key_vault_enable_private_endpoint
  private_endpoint_subnet_id  = var.key_vault_private_endpoint_subnet_id
  log_analytics_workspace_id  = var.key_vault_log_analytics_workspace_id
  tags                        = local.tags
  cmk_key_vault_key_id        = var.key_vault_cmk_key_vault_key_id
  user_assigned_identity_id   = var.key_vault_user_assigned_identity_id
}

# SQL Database
module "sql_database" {
  source                        = "./modules/sql_database"
  sql_server_name               = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = var.sql_database_version
  administrator_login           = var.sql_database_administrator_login
  administrator_login_password  = var.sql_database_administrator_login_password
  sql_database_name             = var.sql_database_name
  sku_name                      = var.sql_database_sku_name
  collation                     = var.sql_database_collation
  max_size_gb                   = var.sql_database_max_size_gb
  zone_redundant                = var.sql_database_zone_redundant
  read_scale                    = var.sql_database_read_scale
  enable_private_endpoint       = var.sql_database_enable_private_endpoint
  private_endpoint_subnet_id    = var.sql_database_private_endpoint_subnet_id
  log_analytics_workspace_id    = var.sql_database_log_analytics_workspace_id
  tags                          = local.tags
  azuread_administrators        = var.sql_database_azuread_administrators
  cmk_key_vault_key_id          = var.sql_database_cmk_key_vault_key_id
  user_assigned_identity_id     = var.sql_database_user_assigned_identity_id
}

# Storage Account
module "storage_account" {
  source                      = "./modules/storage_account"
  storage_account_name        = var.storage_account_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  account_tier                = var.storage_account_tier
  account_replication_type    = var.storage_account_replication_type
  is_hns_enabled              = var.storage_account_is_hns_enabled
  ip_rules                    = var.storage_account_ip_rules
  virtual_network_subnet_ids  = var.storage_account_virtual_network_subnet_ids
  enable_private_endpoint     = var.storage_account_enable_private_endpoint
  private_endpoint_subnet_id  = var.storage_account_private_endpoint_subnet_id
  log_analytics_workspace_id  = var.storage_account_log_analytics_workspace_id
  tags                        = local.tags
  cmk_key_vault_key_id        = var.storage_account_cmk_key_vault_key_id
  user_assigned_identity_id   = var.storage_account_user_assigned_identity_id
  enable_lifecycle            = var.storage_account_enable_lifecycle
  rbac_assignments            = var.storage_account_rbac_assignments
}

# Network Security Group
module "nsg" {
  source                  = "./modules/nsg"
  naming_prefix           = var.naming_prefix
  location                = var.location
  resource_group_name     = var.resource_group_name
  security_rules          = var.nsg_security_rules
  tags                    = local.tags
  log_analytics_workspace_id = var.nsg_log_analytics_workspace_id
  rbac_assignments        = var.nsg_rbac_assignments
  inbound_rules           = var.nsg_inbound_rules
  outbound_rules          = var.nsg_outbound_rules
}

# Subnet
module "subnet" {
  source                = "./modules/subnet"
  naming_prefix         = var.naming_prefix
  resource_group_name   = var.resource_group_name
  virtual_network_name  = module.virtual_network.name
  address_prefixes      = var.subnet_address_prefixes
  service_endpoints     = var.subnet_service_endpoints
  delegation            = var.subnet_delegation
}

# Virtual Machine
module "virtual_machine" {
  source                = "./modules/virtual_machine"
  naming_prefix         = var.naming_prefix
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.vm_admin_username
  admin_ssh_public_key  = var.vm_admin_ssh_public_key
  network_interface_id  = var.vm_network_interface_id
  os_disk_type          = var.vm_os_disk_type
  image_publisher       = var.vm_image_publisher
  image_offer           = var.vm_image_offer
  image_sku             = var.vm_image_sku
  image_version         = var.vm_image_version
  tags                  = local.tags
  disk_encryption_set_id = var.vm_disk_encryption_set_id
  identity_type         = var.vm_identity_type
  custom_data           = var.vm_custom_data
  boot_diagnostics_sa_uri = var.vm_boot_diagnostics_sa_uri
  extensions            = var.vm_extensions
  log_analytics_workspace_id = var.vm_log_analytics_workspace_id
}

# AKS
module "aks" {
  source                  = "./modules/aks"
  name                    = var.aks_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.aks_dns_prefix
  kubernetes_version      = var.aks_kubernetes_version
  sku_tier                = var.aks_sku_tier
  private_cluster_enabled = var.aks_private_cluster_enabled
  node_pool_name          = var.aks_node_pool_name
  node_count              = var.aks_node_count
  vm_size                 = var.aks_vm_size
  os_disk_size_gb         = var.aks_os_disk_size_gb
  min_count               = var.aks_min_count
  max_count               = var.aks_max_count
  vnet_subnet_id          = var.aks_vnet_subnet_id
  network_plugin          = var.aks_network_plugin
  network_policy          = var.aks_network_policy
  load_balancer_sku       = var.aks_load_balancer_sku
  admin_group_object_ids  = var.aks_admin_group_object_ids
}

# Bastion
module "bastion" {
  source                  = "./modules/bastion"
  naming_prefix           = var.naming_prefix
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_name                = var.bastion_dns_name
  subnet_id               = var.bastion_subnet_id
  public_ip_address_id    = var.bastion_public_ip_address_id
  tags                    = local.tags
  log_analytics_workspace_id = var.bastion_log_analytics_workspace_id
  rbac_assignments        = var.bastion_rbac_assignments
}

# App Gateway
module "app_gateway" {
  source                  = "./modules/app_gateway"
  naming_prefix           = var.naming_prefix
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = var.app_gateway_sku_name
  sku_tier                = var.app_gateway_sku_tier
  sku_capacity            = var.app_gateway_sku_capacity
  subnet_id               = var.app_gateway_subnet_id
  public_ip_address_id    = var.app_gateway_public_ip_address_id
  frontend_port           = var.app_gateway_frontend_port
  backend_fqdns           = var.app_gateway_backend_fqdns
  backend_port            = var.app_gateway_backend_port
  backend_protocol        = var.app_gateway_backend_protocol
  listener_protocol       = var.app_gateway_listener_protocol
  tags                    = local.tags
}

# Event Hub
module "event_hub" {
  source                  = "./modules/event_hub"
  naming_prefix           = var.naming_prefix
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku                     = var.event_hub_sku
  partition_count         = var.event_hub_partition_count
  message_retention       = var.event_hub_message_retention
  tags                    = local.tags
  log_analytics_workspace_id = var.event_hub_log_analytics_workspace_id
}

# Service Bus
module "service_bus" {
  source                  = "./modules/service_bus"
  naming_prefix           = var.naming_prefix
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku                     = var.service_bus_sku
  enable_partitioning     = var.service_bus_enable_partitioning
  max_size_in_megabytes   = var.service_bus_max_size_in_megabytes
  tags                    = local.tags
  max_delivery_count      = var.service_bus_max_delivery_count
}

# Log Analytics
module "log_analytics" {
  source                  = "./modules/log_analytics"
  name                    = var.log_analytics_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku                     = var.log_analytics_sku
  retention_in_days       = var.log_analytics_retention_in_days
  tags                    = local.tags
}

# RBAC
module "rbac" {
  source                  = "./modules/rbac"
  assignments             = var.rbac_assignments
}

# Traffic Manager
module "traffic_manager" {
  source = "./modules/traffic_manager"
  name = var.traffic_manager_name
  resource_group_name = var.resource_group_name
  profile_status = var.traffic_manager_profile_status
  traffic_routing_method = var.traffic_manager_traffic_routing_method
  dns_relative_name = var.traffic_manager_dns_relative_name
  dns_ttl = var.traffic_manager_dns_ttl
  monitor_protocol = var.traffic_manager_monitor_protocol
  monitor_port = var.traffic_manager_monitor_port
  monitor_path = var.traffic_manager_monitor_path
  monitor_interval_in_seconds = var.traffic_manager_monitor_interval_in_seconds
  monitor_timeout_in_seconds = var.traffic_manager_monitor_timeout_in_seconds
  monitor_tolerated_number_of_failures = var.traffic_manager_monitor_tolerated_number_of_failures
  tags = local.tags
  log_analytics_workspace_id = var.traffic_manager_log_analytics_workspace_id
}

# Virtual Machine Scale Set
module "virtual_machine_scale_set" {
  source = "./modules/virtual_machine_scale_set"
  naming_prefix = var.naming_prefix
  resource_group_name = var.resource_group_name
  location = var.location
  sku = var.vmss_sku
  instances = var.vmss_instances
  admin_username = var.vmss_admin_username
  admin_ssh_public_key = var.vmss_admin_ssh_public_key
  subnet_id = var.vmss_subnet_id
  os_disk_type = var.vmss_os_disk_type
  image_publisher = var.vmss_image_publisher
  image_offer = var.vmss_image_offer
  image_sku = var.vmss_image_sku
  image_version = var.vmss_image_version
  tags = local.tags
  disk_encryption_set_id = var.vmss_disk_encryption_set_id
  identity_type = var.vmss_identity_type
  custom_data = var.vmss_custom_data
  boot_diagnostics_sa_uri = var.vmss_boot_diagnostics_sa_uri
  enable_autoscale = var.vmss_enable_autoscale
  autoscale_min = var.vmss_autoscale_min
  autoscale_max = var.vmss_autoscale_max
  log_analytics_workspace_id = var.vmss_log_analytics_workspace_id
}

# CDN
module "cdn" {
  source = "./modules/cdn"
  name = var.cdn_name
  resource_group_name = var.resource_group_name
  location = var.location
  sku = var.cdn_sku
  tags = local.tags
  endpoint_name = var.cdn_endpoint_name
  is_http_allowed = var.cdn_is_http_allowed
  is_https_allowed = var.cdn_is_https_allowed
  origin_host_header = var.cdn_origin_host_header
  origin_name = var.cdn_origin_name
  origin_host_name = var.cdn_origin_host_name
  origin_http_port = var.cdn_origin_http_port
  origin_https_port = var.cdn_origin_https_port
  log_analytics_workspace_id = var.cdn_log_analytics_workspace_id
}

# Container Instance
module "container_instance" {
  source = "./modules/container_instance"
  name = var.container_instance_name
  location = var.location
  resource_group_name = var.resource_group_name
  os_type = var.container_instance_os_type
  ip_address_type = var.container_instance_ip_address_type
  dns_name_label = var.container_instance_dns_name_label
  restart_policy = var.container_instance_restart_policy
  container_name = var.container_instance_container_name
  image = var.container_instance_image
  cpu = var.container_instance_cpu
  memory = var.container_instance_memory
  port = var.container_instance_port
  protocol = var.container_instance_protocol
  environment_variables = var.container_instance_environment_variables
  secure_environment_variables = var.container_instance_secure_environment_variables
  commands = var.container_instance_commands
  log_analytics_workspace_id = var.container_instance_log_analytics_workspace_id
  log_analytics_workspace_key = var.container_instance_log_analytics_workspace_key
  tags = local.tags
}

# Private DNS
module "private_dns" {
  source = "./modules/private_dns"
  naming_prefix = var.naming_prefix
  resource_group_name = var.resource_group_name
  dns_zone_name = var.private_dns_zone_name
  vnet_id = var.private_dns_vnet_id
  registration_enabled = var.private_dns_registration_enabled
  tags = local.tags
  log_analytics_workspace_id = var.private_dns_log_analytics_workspace_id
  rbac_assignments = var.private_dns_rbac_assignments
}

# Managed Identity
module "managed_identity" {
  source = "./modules/managed_identity"
  name = var.managed_identity_name
  location = var.location
  resource_group_name = var.resource_group_name
  tags = local.tags
}

# Monitor
module "monitor" {
  source = "./modules/monitor"
  name = var.monitor_name
  resource_group_name = var.resource_group_name
  short_name = var.monitor_short_name
  tags = local.tags
}

# Function App
module "function_app" {
  source = "./modules/function_app"
  naming_prefix = var.naming_prefix
  location = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.function_app_service_plan_id
  storage_account_name = var.function_app_storage_account_name
  storage_account_access_key = var.function_app_storage_account_access_key
  runtime_version = var.function_app_runtime_version
  os_type = var.function_app_os_type
  app_settings = var.function_app_app_settings
  subnet_id = var.function_app_subnet_id
  vnet_id = var.function_app_vnet_id
  tags = local.tags
}

# Logic App
module "logic_app" {
  source = "./modules/logic_app"
  naming_prefix = var.naming_prefix
  location = var.location
  resource_group_name = var.resource_group_name
  definition = var.logic_app_definition
  parameters = var.logic_app_parameters
  tags = local.tags
}

