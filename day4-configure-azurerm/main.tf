# ------------------------------------------------------------------------------
# Test Resource Group using the configured AzureRM Provider
# ------------------------------------------------------------------------------

resource "azurerm_resource_group" "day4_rg" {
  name     = "rg-day04-provider-config"
  location = "East US"

  tags = {
    Day         = "04"
    Topic       = "AzureRM Provider Configuration"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
