output "nic_output" {
  value = zipmap(values(azurerm_network_interface.nic)[*].name, values(azurerm_network_interface.nic)[*].id )
}

output "nic_ip_output" {
  value = zipmap(values(azurerm_network_interface.nic)[*].name, values(azurerm_network_interface.nic)[*].private_ip_address )
}