
output "load_balancers_ipconfig" {
  value = zipmap([for lb in azurerm_lb.external_load_balancer : lb.name], [for lb in azurerm_lb.external_load_balancer : lb.frontend_ip_configuration[0].public_ip_address_id])
}

output "load_balancers" {
  value = zipmap(values(azurerm_lb.external_load_balancer)[*].name, values(azurerm_lb.external_load_balancer)[*].id )
}