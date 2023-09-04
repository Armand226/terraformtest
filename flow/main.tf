provider "azurerm" {
    features{}
}

resource "azurerm_resource_group" "rg"{
  name          = var.resource_group_name
  location      = var.location
}

resource "azurerm_logic_app_workflow" "workflow1" {
  name                 = "${var.logic_app_name}_workflow1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_logic_app_workflow" "workflow2" {
  name                 = "${var.logic_app_name}_workflow2"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
}

resource "azurerm_logic_app_workflow" "workflow3" {
  name                 = "${var.logic_app_name}_workflow3"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
}
