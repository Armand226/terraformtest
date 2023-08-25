terraform {
  backend "azurerm" {
    resource_group_name   = "terratest"
    storage_account_name  = "piskaroro226"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {}
  
}
resource "azurerm_resource_group" "example" {
  name     = "tesla"
  location = "South Central US"
}
