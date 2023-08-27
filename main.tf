provider "azurerm" {
  features {}
  
}
resource "azurerm_servicebus_namespace" "example" {
  name                = "example-sbns"
  location            = "South central US"
  resource_group_name = "testing123"
  sku                 = "Standard"
}
