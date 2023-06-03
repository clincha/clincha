terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstateclincha"
    container_name       = "tfstateclincha"
    key                  = "clincha_terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-tfstate" {
  name     = "tfstate"
  location = "eu-west-2"
}
