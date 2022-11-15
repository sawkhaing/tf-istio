terraform {
  required_version = ">=1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate26684"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "helm" {
  kubernetes {
    config_path = var.config_path
  }
}