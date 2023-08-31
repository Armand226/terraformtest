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

  template_content = file ("storage-template.json")

  parameters_content = jsonencode({
    "storageAccountName" = {
      "value" = "mystorageaccount5464646"
    },
    "location" = {
      "value" = "South Central US"
    }
  })
}
