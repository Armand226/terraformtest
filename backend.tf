terraform {
  backend "azurerm" {
    resource_group_name   = "terratest"
    storage_account_name  = "piskaroro226"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
