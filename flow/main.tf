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

resource "azurerm_resource_group_template_deployment" "example" {
  name                = "deploy656459"
  resource_group_name = "terratest"
  deployment_mode     = "Incremental"
 template_content = <<TEMPLATE
{
  "definition": {
    "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
    "actions": {
      "Execute_Query": {
        "inputs": {
          "parameters": {
            "query": "select * from testtable"
          },
          "serviceProviderConfiguration": {
            "connectionName": "sql",
            "operationId": "executeQuery",
            "serviceProviderId": "/serviceProviders/sql"
          }
        },
        "runAfter": {},
        "type": "ServiceProvider"
      }
    },
    "contentVersion": "1.0.0.0",
    "outputs": {},
    "triggers": {
      "Recurrence": {
        "recurrence": {
          "frequency": "Week",
          "interval": 15
        },
        "type": "Recurrence"
      }
    }
  },
  "kind": "Stateful"
}
TEMPLATE

  }
