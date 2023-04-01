terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "varonistatesa"
    container_name       = "varonis-state"
    key                  = "varonis-state.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "4499f48b-2710-4b85-9e67-d391e4696edc"
}
