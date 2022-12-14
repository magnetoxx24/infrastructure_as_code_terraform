#### create network security group for network resources ####
resource "azurerm_network_security_group" "nsg" {
  depends_on          = [azurerm_resource_group.rg]
  name                = var.azurerm_network_security_group
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }

}