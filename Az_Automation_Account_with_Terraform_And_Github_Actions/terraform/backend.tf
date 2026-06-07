terraform {

  backend "azurerm" {

    resource_group_name  = "rg-tfstate"

    storage_account_name = "satfstate001"

    container_name       = "tfstate"

    key = "automation-account.tfstate"

  }

}