# ==============================================================================
# INPUT VARIABLES
# ==============================================================================

variable "resource_group_name" {
  type        = string
  description = "Base name of the Azure Resource Group"
  default     = "rg-day07-outputs-demo"
}

variable "location" {
  type        = string
  description = "Azure region for all resources"
  default     = "East US"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
  default     = "dev"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the Virtual Network"
  default     = ["10.70.0.0/16"]
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for the public frontend subnet"
  default     = ["10.70.1.0/24"]
}

variable "tags" {
  type        = map(string)
  description = "Resource tags"
  default = {
    Day         = "07"
    Topic       = "Terraform Outputs"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
