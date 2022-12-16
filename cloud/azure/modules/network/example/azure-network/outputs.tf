// OUTPUT OF REQUIRED INFORMATION
output "resource_group" {
  value = var.resource_group_name
}
output "location" {
  value = var.location
}

// outputs NSG 
output "azurerm_network_security_group" {
  value = var.azurerm_network_security_group
}
// outputs DDOS
output "azurerm_network_ddos_protection_plan" {
  value = var.azurerm_network_ddos_protection_plan
}
// outputs VNET
output "virtual_network_name" {
  value = var.virtual_network_name
}
output "virtual_network_address_prefix" {
  value = var.virtual_network_address_prefix
}

// output Subnets 
output "subnets" {
  value = var.subnets
}

// output resources peering\
output "peering_name" {
  value = var.peering_name
}
output "peering_id_remote" {
  value = var.peering_id_remote
}