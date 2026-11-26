# ==============================================================================
# INPUT VARIABLES DEFINITIONS
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. String Variable (Resource Group Name)
# ------------------------------------------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group"
  default     = "rg-day06-variables-demo"
}

# ------------------------------------------------------------------------------
# 2. String Variable with Validation (Azure Region)
# ------------------------------------------------------------------------------
variable "azure_region" {
  type        = string
  description = "The Azure region where resources will be deployed"
  default     = "East US"

  validation {
    condition     = contains(["East US", "East US 2", "West US", "West Europe", "Central India"], var.azure_region)
    error_message = "The azure_region must be one of: East US, East US 2, West US, West Europe, Central India."
  }
}

# ------------------------------------------------------------------------------
# 3. String Variable (Deployment Environment)
# ------------------------------------------------------------------------------
variable "environment" {
  type        = string
  description = "Target deployment environment (dev, staging, prod)"
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be either 'dev', 'staging', or 'prod'."
  }
}

# ------------------------------------------------------------------------------
# 4. List Variable (Virtual Network Address Space)
# ------------------------------------------------------------------------------
variable "vnet_address_space" {
  type        = list(string)
  description = "Address space CIDR blocks for the Virtual Network"
  default     = ["10.10.0.0/16"]
}

# ------------------------------------------------------------------------------
# 5. List Variable (Subnet Address Prefixes)
# ------------------------------------------------------------------------------
variable "subnet_prefixes" {
  type        = list(string)
  description = "Address prefix CIDR blocks for the default subnet"
  default     = ["10.10.1.0/24"]
}

# ------------------------------------------------------------------------------
# 6. Map Variable (Common Resource Tags)
# ------------------------------------------------------------------------------
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to all resources"
  default = {
    Day         = "06"
    Topic       = "Input Variables"
    ManagedBy   = "Terraform"
    Environment = "Development"
  }
}

# ------------------------------------------------------------------------------
# 7. Boolean Variable (Feature Toggle)
# ------------------------------------------------------------------------------
variable "create_subnet" {
  type        = bool
  description = "Flag to determine whether a dedicated subnet should be created"
  default     = true
}
