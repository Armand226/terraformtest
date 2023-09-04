provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "terratest"
  location = "South Central US"
}

resource "azurerm_logic_app_standard" "example" {
  name                = "logicapp124578"
storage_account_name  = "piskaroro226"
  resource_group_name = "terrstest"
  location            = "South Central US"
}

resource "azurerm_logic_app_workflow" "workflow1" {
  name                = "workflow1"
  logic_app_id        = azurerm_logic_app_standard.example.id
  resource_group_name = azurerm_resource_group.example.name
  location            = "South Central US"

  tags = {
    "environment" = "prod"
  }
}

resource "azurerm_logic_app_workflow" "workflow2" {
  name                = "workflow2"
  logic_app_id        = azurerm_logic_app_standard.example.id
  resource_group_name = azurerm_resource_group.example.name
  location            = "South Central US"

  tags = {
    "environment" = "prod"
  }
}

/* Triggers and actions for workflow1
resource "azurerm_logic_app_trigger_recurrence" "workflow1_trigger" {
  name         = "recurrence"
  logic_app_id = azurerm_logic_app_workflow.workflow1.id
  frequency    = "Day"
  interval     = 1
}

resource "azurerm_logic_app_action_http" "workflow1_action" {
  name         = "http_action"
  logic_app_id = azurerm_logic_app_workflow.workflow1.id
  method       = "GET"
  uri          = "http://example.com"

  depends_on = [azurerm_logic_app_trigger_recurrence.workflow1_trigger]
}

# Triggers and actions for workflow2
resource "azurerm_logic_app_trigger_recurrence" "workflow2_trigger" {
  name         = "recurrence"
  logic_app_id = azurerm_logic_app_workflow.workflow2.id
  frequency    = "Hour"
  interval     = 1
}

resource "azurerm_logic_app_action_http" "workflow2_action" {
  name         = "http_action"
  logic_app_id = azurerm_logic_app_workflow.workflow2.id
  method       = "GET"
  uri          = "http://example.org"

  depends_on = [azurerm_logic_app_trigger_recurrence.workflow2_trigger]
}
*/
