#### creating a ddos protection plan resource for vnet resources ####
resource "azurerm_network_ddos_protection_plan" "ddospp" {
  depends_on          = [azurerm_resource_group.rg]
  name                = var.azurerm_network_ddos_protection_plan
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags

  lifecycle {
    prevent_destroy = false
  }
}