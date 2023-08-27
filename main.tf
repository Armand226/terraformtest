provider "azurerm" {
  features {}
  
}
provider "azurerm" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  #   client_id       = var.client_id
  #   client_secret   = var.client_secret

  features {
  }
}

locals {
  servicebus = {
    "topic_1" = [{
      subscription = ["subscription1", "subscription2", "subscription3"]
    }],
    "topic_2" = [{
      subscription = ["subscription4", "subscription5", "subscription6"]
    }],
	"topic_3" = [{
      subscription = ["subscription7", "subscription8", "subscription9"]
    }]
  }

################
  service_bus = flatten([
    for topicname, topic in local.servicebus : [
      for subname in topic : {
        name                = topicname
        subscription_name   = subname.subscription
      }
    ]
  ])

}

resource "azurerm_resource_group" "rg" {
  name     = "rg77777"
  location = "eastus2"
}

############  Creating Servicebus Namespace ########################### 
module "servicebus_namespace" {
  source              = "./servicebus/namespace"
  name                = "servicebusnamespace-name"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku      = "Standard"
  capacity = "0"
}

############  Creating Servicebus Topic ############################### 
module "servicebus_topic" {
  source                = "./servicebus/topic"
  for_each = {
    for sname in local.service_bus : sname.name => sname
  }
  name                  = each.value.name
  resource_group_name   = azurerm_resource_group.rg.name
  namespace_name        = module.servicebus_namespace.name
  max_size_in_megabytes = "1024"
  depends_on            = [module.servicebus_namespace.name]
}

##########  Creating Servicebus Subscription ############################### 
resource "azurerm_servicebus_subscription" "sbs" {  
  for_each = {
    for sname in local.service_bus : sname.name => sname
  }  
  name                = each.value.subscription_name
  topic_name          = module.servicebus_topic[each.value.name].name
  namespace_name      = module.servicebus_namespace.name
  resource_group_name = azurerm_resource_group.rg.name
  max_delivery_count  = "10"

}
