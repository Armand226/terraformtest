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
  name                = "example-deploy"
  resource_group_name = "example-group"
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "vnetName" = {
      value = local.vnet_name
    }
  })
  template_content = <<TEMPLATE
{
    "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "vnetName": {
            "type": "string",
            "metadata": {
                "description": "Name of the VNET"
            }
        }
    },
    "variables": {},
    "resources": [
        {
            "type": "Microsoft.Network/virtualNetworks",
            "apiVersion": "2020-05-01",
            "name": "[parameters('vnetName')]",
            "location": "[resourceGroup().location]",
            "properties": {
                "addressSpace": {
                    "addressPrefixes": [
                        "10.0.0.0/16"
                    ]
                }
            }
        }
    ],
    "outputs": {
      "exampleOutput": {
        "type": "string",
        "value": "someoutput"
      }
    }
}
TEMPLATE
