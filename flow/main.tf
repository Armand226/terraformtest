provider "azurerm" {
  features {}
skip_provider_registration = true
}

resource "azurerm_linux_web_app" "example" {
  name                = var.app_service_name
  location            = "East US"  # Change it to your desired location
  resource_group_name = var.resource_group_name  # Replace with your existing resource group name
  service_plan_id = "/subscriptions/subscription-id/resourceGroups/existing-resource-group-name/providers/Microsoft.Web/serverfarms/${var.service_plan_id}"

  site_config {
    #linux_fx_version = "NODE|18"
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "18.14.0"  # Specify Node.js 18 version
  
  }
}
