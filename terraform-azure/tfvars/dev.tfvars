naming_prefix = "devproj"
environment  = "dev"
location     = "eastus"
owner        = "your.name@company.com"
cost_center  = "DEV123"
extra_tags   = {
  project = "terraform-azure-demo"
}
resource_group_name = "dev-rg"
vnet_address_space = ["10.0.0.0/16"]
vnet_dns_servers   = []

# App Service
app_service_subnet_id = "<subnet-id>"
app_service_kind = "Linux"
app_service_reserved = true
app_service_sku_tier = "Standard"
app_service_sku_size = "S1"
app_service_identity_type = "SystemAssigned"
app_service_cors_allowed_origins = []
app_service_cors_support_credentials = false
app_service_ip_restriction = []
app_service_scm_ip_restriction = []
app_service_auth_enabled = false
app_service_auth_default_provider = null
app_service_auth_issuer = null

# Key Vault
key_vault_name = "dev-kv"
tenant_id = "<tenant-guid>"
key_vault_sku_name = "standard"
key_vault_enable_rbac_authorization = true
key_vault_ip_rules = []
key_vault_virtual_network_subnet_ids = []
key_vault_access_policies = []
key_vault_enable_private_endpoint = false
key_vault_private_endpoint_subnet_id = null
key_vault_log_analytics_workspace_id = null
key_vault_cmk_key_vault_key_id = null
key_vault_user_assigned_identity_id = null

# SQL Database
sql_server_name = "dev-sql"
sql_database_version = "12.0"
sql_database_administrator_login = "sqladmin"
sql_database_administrator_login_password = "P@ssw0rd1234!"
sql_database_name = "devdb"
sql_database_sku_name = "S0"
sql_database_collation = "SQL_Latin1_General_CP1_CI_AS"
sql_database_max_size_gb = 5
sql_database_zone_redundant = false
sql_database_read_scale = false
sql_database_enable_private_endpoint = false
sql_database_private_endpoint_subnet_id = null
sql_database_log_analytics_workspace_id = null
sql_database_azuread_administrators = []
sql_database_cmk_key_vault_key_id = null
sql_database_user_assigned_identity_id = null

# Storage Account
storage_account_name = "devstorageacct"
storage_account_tier = "Standard"
storage_account_replication_type = "LRS"
storage_account_is_hns_enabled = false
storage_account_ip_rules = []
storage_account_virtual_network_subnet_ids = []
storage_account_enable_private_endpoint = false
storage_account_private_endpoint_subnet_id = null
storage_account_log_analytics_workspace_id = null
storage_account_cmk_key_vault_key_id = null
storage_account_user_assigned_identity_id = null
storage_account_enable_lifecycle = false
storage_account_rbac_assignments = []
# Application Insights
app_insights_name = "dev-appinsights"
app_insights_application_type = "web"
app_insights_workspace_id = null
app_insights_retention_in_days = 90
app_insights_sampling_percentage = 100

# Azure Redis Cache
redis_name = "dev-redis"
redis_family = "C"
redis_capacity = 1
redis_sku_name = "Basic"
redis_enable_non_ssl_port = false
redis_minimum_tls_version = "1.2"
redis_subnet_id = null
redis_static_ip = null

# Azure Container Registry
acr_name = "devacr"
acr_sku = "Basic"
acr_admin_enabled = false
acr_georeplications = []
acr_identity_type = "SystemAssigned"
acr_network_rule_set = []
acr_private_endpoint_subnet_id = null

# Azure Function App
function_app_name = "dev-func"
function_app_service_plan_id = "<app-service-plan-id>"
function_app_storage_account_name = "devstorageacct"
function_app_storage_account_access_key = "<storage-account-access-key>"
function_app_runtime_version = "~4"
function_app_os_type = "linux"
function_app_app_settings = {}
function_app_identity_type = "SystemAssigned"
function_app_subnet_id = null
function_app_vnet_id = null
logic_app_definition = "{}"
logic_app_parameters = {}

# Azure Cosmos DB
cosmosdb_account_name = "dev-cosmosdb"
cosmosdb_kind = "GlobalDocumentDB"
cosmosdb_offer_type = "Standard"
cosmosdb_enable_automatic_failover = false
cosmosdb_consistency_policy = "Session"
cosmosdb_locations = []
cosmosdb_virtual_network_rules = []
cosmosdb_private_endpoint_subnet_id = null

# Azure API Management
apim_name = "dev-apim"
apim_publisher_email = "your.name@company.com"
apim_publisher_name = "Dev Team"
apim_sku_name = "Developer"
apim_virtual_network_type = "None"
apim_enable_client_certificate = false
apim_enable_managed_identity = false
apim_virtual_network_configuration_subnet_id = null
apim_identity_type = "SystemAssigned"
apim_tags = {}

# Azure Service Bus
servicebus_namespace_name = "dev-sb"
servicebus_sku = "Basic"
servicebus_zone_redundant = false
servicebus_enable_private_endpoint = false
servicebus_private_endpoint_subnet_id = null
servicebus_tags = {}

# Azure Application Gateway
appgw_name = "dev-appgw"
appgw_sku_name = "WAF_v2"
appgw_sku_tier = "WAF_v2"
appgw_capacity = 2
appgw_subnet_id = null
appgw_enable_http2 = true
appgw_firewall_enabled = true
appgw_tags = {}

# Azure Log Analytics
log_analytics_workspace_name = "dev-law"
log_analytics_sku = "PerGB2018"
log_analytics_retention_in_days = 30
log_analytics_tags = {}

# Traffic Manager
traffic_manager_name = "dev-tm"
traffic_manager_profile_status = "Enabled"
traffic_manager_traffic_routing_method = "Performance"
traffic_manager_dns_relative_name = "devtm"
traffic_manager_dns_ttl = 60
traffic_manager_monitor_protocol = "HTTP"
traffic_manager_monitor_port = 80
traffic_manager_monitor_path = "/"
traffic_manager_monitor_interval_in_seconds = 30
traffic_manager_monitor_timeout_in_seconds = 10
traffic_manager_monitor_tolerated_number_of_failures = 3
traffic_manager_log_analytics_workspace_id = null

# Virtual Machine Scale Set
vmss_sku = "Standard_B2ms"
vmss_instances = 2
vmss_admin_username = "azureuser"
vmss_admin_ssh_public_key = "ssh-rsa AAA..."
vmss_subnet_id = "<subnet-id>"
vmss_os_disk_type = "Standard_LRS"
vmss_image_publisher = "Canonical"
vmss_image_offer = "UbuntuServer"
vmss_image_sku = "18.04-LTS"
vmss_image_version = "latest"
vmss_disk_encryption_set_id = null
vmss_identity_type = "SystemAssigned"
vmss_custom_data = null
vmss_boot_diagnostics_sa_uri = null
vmss_enable_autoscale = false
vmss_autoscale_min = "1"
vmss_autoscale_max = "3"

# CDN (remaining)
cdn_name = "dev-cdn"
cdn_sku = "Standard_Microsoft"
cdn_endpoint_name = "dev-cdn-endpoint"
cdn_is_http_allowed = true
cdn_is_https_allowed = true
cdn_origin_host_header = "example.com"
cdn_origin_name = "origin1"
cdn_origin_host_name = "origin1.example.com"
cdn_origin_http_port = 80
cdn_origin_https_port = 443
cdn_log_analytics_workspace_id = null

# Container Instance
container_instance_name = "dev-aci"
container_instance_os_type = "Linux"
container_instance_ip_address_type = "Public"
container_instance_dns_name_label = "devaci"
container_instance_restart_policy = "Always"
container_instance_container_name = "devcontainer"
container_instance_image = "nginx:latest"
container_instance_cpu = 1
container_instance_memory = 1.5
container_instance_port = 80
container_instance_protocol = "TCP"
container_instance_environment_variables = {}
container_instance_secure_environment_variables = {}
container_instance_commands = []
container_instance_log_analytics_workspace_id = null
container_instance_log_analytics_workspace_key = null

# Private DNS
private_dns_zone_name = "privatedns.local"
private_dns_vnet_id = "<vnet-id>"
private_dns_registration_enabled = false
private_dns_log_analytics_workspace_id = null
private_dns_rbac_assignments = []

# Managed Identity
managed_identity_name = "dev-mi"

# Monitor
monitor_name = "dev-monitor"
monitor_short_name = "devmon"
