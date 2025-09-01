terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
  required_version = ">1.0.0"

  backend "azurerm" {
    resource_group_name  = "dev_rg_4769"
    storage_account_name = "devstg4769"
    container_name       = "dev"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "99c7c7ea-a267-488b-9d38-a2547f06712c"
}