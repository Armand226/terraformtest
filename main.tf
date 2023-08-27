provider "azurerm" {
  features {}
  
}
resource "azurerm_servicebus_namespace" "example" {
  name                = "sbns2254411"
  location            = "South central US"
  resource_group_name = "testing123"
  sku                 = "Standard"
}
resource "azurerm_servicebus_topic" "example" {
  count               = length(var.topics)
  name                = var.topics[count.index]
  namespace_name      = azurerm_servicebus_namespace.example.name
  resource_group_name = "terratest"
}

resource "azurerm_servicebus_subscription" "example" {
  count               = length(var.topics)
  name                = "${var.topics[count.index]}-subscription"
  namespace_name      = azurerm_servicebus_namespace.example.name
  topic_name          = azurerm_servicebus_topic.example[count.index].name
  resource_group_name = "my-resource-group"
}
