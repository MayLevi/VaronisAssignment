
output "rg_output" {
  value = zipmap(values(azurerm_resource_group.resource_group)[*].name, values(azurerm_resource_group.resource_group)[*].location )
}