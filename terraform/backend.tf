terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "hawkfield"
    container_name       = "production"
    key                  = "hl.prod.state"
  }
}

provider "azurerm" {
  features {}
}
