terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "1.44.0"
    }
  }
  #   backend "azurerm" {
  #     resource_group_name  = "M24-AZ-RG-EASTUS2-PROD-001"
  #     storage_account_name = "m24azsat24prod001"
  #     container_name       = "tfstate-azure-network"
  #     key                  = "tfstate-azure-network.terraform.tfstate"
  # }
}

provider "azurerm" {
  # Configuration options
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}