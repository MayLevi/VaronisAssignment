resource "azurerm_virtual_network" "virtual_network" {
  for_each            = var.virtualNetworks
  name                = "vnet-${each.value.subsctiption}-${each.value.env}-${lower(each.value.region)}-${each.value.vnetIndex}"
  address_space       = each.value.address_space
  location            = each.value.region
  resource_group_name = each.value.rg_name
  dns_servers         = each.value.dns_servers
  tags                = var.tags
  
}
