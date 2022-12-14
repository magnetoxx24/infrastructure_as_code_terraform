output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "network_security_group" {
  value = azurerm_network_security_group.nsg
}

output "ddos_protection_plan" {
  value = azurerm_network_ddos_protection_plan.ddospp
}


output "vnet" {
  value = azurerm_virtual_network.vnet.name
}

output "address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnets" {
  value = azurerm_virtual_network.vnet.subnet
}

output "dns_servers" {
  value = var.dns_servers
}


// output resources peering

output "peering_name" {
  value = var.peering_name
}

output "peering_id_remote" {
  value = var.peering_id_remote
}