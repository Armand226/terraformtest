resource "azurerm_linux_web_app" "example" {
  name                = var.app_service_name
  location            = "East US"  # Change it to your desired location
  resource_group_name = var.resource_group_name  # Replace with your existing resource group name
  app_service_plan_id = "/subscriptions/subscription-id/resourceGroups/existing-resource-group-name/providers/Microsoft.Web/serverfarms/${var.app_service_plan_name}"

  # Additional configurations...
}
