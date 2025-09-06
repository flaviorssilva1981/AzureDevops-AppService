terraform {
  required_version = ">= 1.5.0"

  backend "azurerm" {
    resource_group_name  = "RG-IGTI-TEST"
    storage_account_name = "tfstateflavio001"
    container_name       = "tfstate"
    key                  = "appservice.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }
}
