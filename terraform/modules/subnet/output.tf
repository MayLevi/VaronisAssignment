output "subnet_output" {
  value = zipmap(values(azurerm_subnet.subnet)[*].name, values(azurerm_subnet.subnet)[*].id )
}
