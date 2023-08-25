provider "azurerm" {
  features {}
  tenant_id       = "YOUR_TENANT_ID"
  client_id       = "YOUR_CLIENT_ID"
  client_secret   = "YOUR_CLIENT_SECRET"
  subscription_id = "YOUR_SUBSCRIPTION_ID"
}
resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "East US"
}
