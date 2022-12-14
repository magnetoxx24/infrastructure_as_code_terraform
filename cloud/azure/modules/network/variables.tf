#### Variables Resource Group ####
variable "resource_group_name" {
  type        = string
  description = "Name azure Resource group for M24 vnet."
}

variable "location" {
  type        = string
  description = "Location of the resources."
}

#### Variables Resource Network Security Group ####
variable "azurerm_network_security_group" {
  type        = string
  description = "Name Azure Network Security Group"
}

#### Variables Resource Network DDoS Protection Plan ####
variable "azurerm_network_ddos_protection_plan" {
  type        = string
  description = "Name Azure Network DDoS Protection Plan"
}

#### Variables Resources VNET ####
variable "virtual_network_name" {
  type        = string
  description = "Virtual network name"
}

variable "virtual_network_address_prefix" {
  type        = string
  description = "VNET address prefix"
}

#### Variables Subnets of VNET 
variable "subnets" {
  type = map(object({
    name           = string
    address_prefix = string
  }))
  description = "Subnet address prefix."
}

// Variables DNS Servers for VNETS
variable "dns_servers" {
  type        = list(string)
  description = "The DNS servers to be used with vNet"
}


// Variables resources peering

variable "peering_name" {
  type = string
  description = "Peering created between vNets"
}

variable "peering_id_remote" {
  type = string
  description = "Remote vNet Peering ID"
}

variable "allow_virtual_network_access" {
  type    = bool
  default = true
}

variable "allow_forwarded_traffic" {
  type    = bool
  default = false
}

variable "allow_gateway_transit" {
  type    = bool
  default = false
}

variable "use_remote_gateways" {
  type    = bool
  default = true
}


variable "tags" {
  type        = map(string)
  description = "Tags For Resources"
}
