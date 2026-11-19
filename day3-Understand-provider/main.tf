# Configure the Azure Provider
provider "azurerm" {
  features {}
}

# Example Resource Block: Demonstrating Provider + Resource mapping
resource "azurerm_resource_group" "demo" {
  name     = "rg-day03-architecture-demo"
  location = "East US"

  tags = {
    Day         = "03"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}
