provider "azurerm" {
  features {}
  
}
resource "azurerm_servicebus_topic" "sb" {
  count                          = length (var.topic_names)
  name                           = var.topic_names[count.index]
  max_size_in_megabytes          = var.max_size_in_megabytes
  namespace_id                   = var.namespace_id
  enable_partitioning            = false  
}

resource "azurerm_servicebus_subscription" "sb" {
  count                          = length (var.topic_names)
  name                           = "${var.topic_names[count.index]}-subscription"
  topic_id                       = azurerm_servicebus_topic.sb[count.index].id
  max_delivery_count             = 3
}




