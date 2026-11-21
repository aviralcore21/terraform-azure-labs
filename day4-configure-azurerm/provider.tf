# ------------------------------------------------------------------------------
# Terraform & Provider Declaration
# ------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# ------------------------------------------------------------------------------
# Microsoft Azure Provider Configuration
# ------------------------------------------------------------------------------

# Default Provider Block
# Authentication is automatically retrieved via Azure CLI ('az login')
# or environment variables (ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID)
provider "azurerm" {
  features {
    # Optional customized feature behavior guardrails:
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
  }
}

# Example of an Aliased Provider (for secondary region / subscription deployments)
provider "azurerm" {
  alias = "secondary"
  features {}
}
