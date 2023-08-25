provider "azurerm" {
  features {}
  
}
resource "azurerm_resource_group" "example" {
  name     = "tesla"
  location = "South Central US"
}
