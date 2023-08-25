provider "azurerm" {
  features {}
  tenant_id       = var.ARM_TENANT_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  subscription_id = var.ARM_SUBSCRIPTION_ID
}
resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "South Central US"
}
