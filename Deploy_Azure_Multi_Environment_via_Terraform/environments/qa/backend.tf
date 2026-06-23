terraform {
  required_version = ">= 1.5.0"
  backend "azurerm" {
    resource_group_name  = "rg-shared-tfstate"
    storage_account_name = "sttfstateallenv001"
    container_name       = "tfstate"
    key                  = "qa.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}