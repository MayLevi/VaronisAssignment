resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnets
  name                                           = "snet-${each.value.subsctiption}-${each.value.env}-${lower(each.value.region)}-${each.value.subIndex}"
  resource_group_name                            = each.value.rg_name
  virtual_network_name                           = each.value.vnet_name
  address_prefixes                               = each.value.address_prefixes


}
