output "vnet_output" {
  value = zipmap(values(azurerm_virtual_network.virtual_network)[*].name, values(azurerm_virtual_network.virtual_network)[*].id)
}