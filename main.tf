provider "azurerm" {
  features {}
  
}

resource "azurerm_servicebus_topic" "example" {
  count               = length(var.topics)
  name                = var.topics[count.index]
  namespace_name      = azurerm_servicebus_namespace.example.name
  resource_group_name = "terratest"
  namespace_id        = ""
}

resource "azurerm_servicebus_subscription" "example" {
  count               = length(var.topics)
  name                = "${var.topics[count.index]}-subscription"
  namespace_name      = azurerm_servicebus_namespace.example.name
  topic_name          = azurerm_servicebus_topic.example[count.index].name
  resource_group_name = "my-resource-group"
}
