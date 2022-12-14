// CREATION OF RESOURCE GROUP AND DEFINITION OF LOCATION
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}

// CALL NETWORK MODULE 
module "network" {
  source = "../../../modules/network/"

  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = azurerm_resource_group.rg.location
  azurerm_network_security_group       = var.azurerm_network_security_group
  azurerm_network_ddos_protection_plan = var.azurerm_network_ddos_protection_plan
  virtual_network_name                 = var.virtual_network_name
  virtual_network_address_prefix       = var.virtual_network_address_prefix
  subnets                              = var.subnets

  // PEERING
  peering_name      = var.peering_name
  peering_id_remote = var.peering_id_remote

  // DNS SERVERS
  dns_servers = var.dns_servers
  tags        = var.tags
}
















