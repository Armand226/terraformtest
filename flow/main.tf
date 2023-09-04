provider "azurerm" {
  features {}
}


resource "azurerm_logic_app_standard" "example" {
  name                = "logicapp124578"
storage_account_name  = "piskaroro226"
  resource_group_name = "terratest"
storage_account_access_key = "O9L4Mseg+ymMVOHwJKpySZxYXPE3+GjInxchweqsE5+GZXhgJCF0Qe1vi1DdqKUxilJQxEQq36cg+AStgyqSRQ=="
app_service_plan_id = "/subscriptions/81da11eb-9e84-4c84-9f2f-18d6145cd8ca/resourcegroups/terratest/providers/Microsoft.Web/serverFarms/test3456"
  location            = "South Central US"
}

resource "azurerm_logic_app_workflow" "workflow1" {
  name                = "workflow1"
 
  resource_group_name = "terratest"
  location            = "South Central US"

  tags = {
    "environment" = "prod"
  }
}

resource "azurerm_logic_app_workflow" "workflow2" {
  name                = "workflow2"
 
  resource_group_name = "terratest"
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
