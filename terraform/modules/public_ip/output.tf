output "pip_output" {
  value = zipmap(values(azurerm_public_ip.public_ip)[*].name, values(azurerm_public_ip.public_ip)[*].id)
}