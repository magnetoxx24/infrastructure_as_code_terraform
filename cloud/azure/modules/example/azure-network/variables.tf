#### Variables Resource Group ####
variable "resource_group_name" {
  default     = "M24-AZ-NETWORKING-EASTUS2-STAGING-001"
  description = "Name azure Resource group for M24 vnet."
}

variable "location" {
  default     = "East US 2"
  description = "Location of the resources."
}

// Variables NSG 
variable "azurerm_network_security_group" {
  type = string
}

// Variables DDOS
variable "azurerm_network_ddos_protection_plan" {
  type = string
}

// Variables VNET
variable "virtual_network_name" {
  type = string
}
variable "virtual_network_address_prefix" {
  type = string
}


// Variables Subnets 
variable "subnets" {
  type = map(object({
    name           = string
    address_prefix = string
  }))
  description = "Subnet address prefix."
}

// Variables Peering 
variable "peering_name" {
  type = string
}
variable "peering_id_remote" {
  type = string
}

// Variables DNS Servers
variable "dns_servers" {
  type = list(string)
}

// Variables tags
variable "tags" {
  type = map(string)
}


// Variables provider Azurerm
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}




