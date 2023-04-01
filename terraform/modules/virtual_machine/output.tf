output "vm_output" {
  value = zipmap(values(azurerm_windows_virtual_machine.windows_vm)[*].name,values(azurerm_windows_virtual_machine.windows_vm)[*].id )
}