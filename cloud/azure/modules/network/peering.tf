#### creation of peering vnets ####
resource "azurerm_virtual_network_peering" "peering" {
  name                         = var.peering_name
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnet.name
  remote_virtual_network_id    = var.peering_id_remote
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  use_remote_gateways          = var.use_remote_gateways

  lifecycle {
    prevent_destroy = false
  }
}
