terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.34.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "terraform6state"
    container_name       = "tfstate"
    key                  = "tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

module "resource_group" {
  source       = "./modules/resource-group"
  project_name = var.project_name
  location     = var.location
}

module "container_app" {
  source              = "./modules/container-app"
  project_name        = var.project_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  image_url           = var.image_url
}