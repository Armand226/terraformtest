provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "South central US"
}

resource "azurerm_resource_group_template_deployment" "example" {
  name                = "example-deployment"
  resource_group_name = azurerm_resource_group.example.name
  deployment_mode     = "Incremental"

  template_content = storage-template.json

  parameters_content = jsonencode({
    "storageAccountName" = {
      "value" = "mystorageaccount"
    },
    "location" = {
      "value" = "West Europe"
    }
  })
}
