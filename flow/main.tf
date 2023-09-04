provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "example" {
  name                = "azure-functions-test-serv-plan"
  location            = "South Central US"
  resource_group_name = "terratest"
  kind                = "elastic"


  sku {
    tier = "WorkflowStandard"
    size = "WS1"
  }
}

resource "azurerm_logic_app_standard" "example" {
  name                = "logicapp124578"
storage_account_name  = "piskaroro226"
  resource_group_name = "terratest"
storage_account_access_key = "HNZhlCkht7HuEJoDDeaCdA1Gqyq1PqxSdSFeuAtkGJBkL6g35qsaLuK6pHN5tadMwnTo6TDICl18+ASthncr1Q=="
app_service_plan_id = azurerm_app_service_plan.example.id
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
