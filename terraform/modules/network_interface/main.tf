resource "azurerm_network_interface" "nic" {
  for_each            = var.networkInterfaces
  name                = "nic-${each.value.subsctiption}-${each.value.env}-${lower(each.value.region)}-${each.value.index}"
  location            = each.value.region
  resource_group_name = "${each.value.rg_name}"
  tags                = var.tags


  dynamic ip_configuration {
    for_each= each.value.ip_configuration
    content{
      name                          = ip_configuration.value.ip_configuration_name
      subnet_id                     = lookup(var.subnets,"${ip_configuration.value.subnet_name}") 
      private_ip_address            = ip_configuration.value.private_ip
      private_ip_address_allocation = "Static"
    }

  }

}