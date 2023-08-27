provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  resource_group_name     = var.resource_group_name
  location                = var.location
}

resource "azurerm_servicebus_namespace" "sb" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}
