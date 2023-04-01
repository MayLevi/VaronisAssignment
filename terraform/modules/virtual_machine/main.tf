resource "azurerm_windows_virtual_machine" "windows_vm" {
  for_each            = var.windowsVirtualMachines
  name                = "winvm-${each.value.subsctiption}-${each.value.env}-${lower(each.value.region)}-${each.value.vmIndex}"
  location            = each.value.region
  resource_group_name = each.value.rg_name
  size                = each.value.size
  admin_username      = each.value.username
  admin_password      = var.adminpass
  computer_name                = each.value.computer_name
  provision_vm_agent         = true
  allow_extension_operations = true
  enable_automatic_updates   = true
  license_type               = "Windows_Client"
  network_interface_ids = [lookup(var.networkInterfaces,each.value.network_interface_name)]
  tags                = var.tags
  

  source_image_reference {

      publisher = each.value.publisher
      offer     = each.value.offer
      sku       = each.value.sku
      version   = "latest"
    

  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = each.value.os_disk_storage_account_type
  }

  additional_capabilities {
          ultra_ssd_enabled = false 
  }
}