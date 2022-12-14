#### vnet and subnet resource creation #### 
resource "azurerm_virtual_network" "vnet" {

  depends_on          = [azurerm_resource_group.rg]
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network_address_prefix]
  dns_servers         = var.dns_servers

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.ddospp.id
    enable = true
  }
  dynamic "subnet" {
    for_each = var.subnets

    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address_prefix"]
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}