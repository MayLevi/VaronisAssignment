variable "windowsVirtualMachines" {
  type = map(object({
    subsctiption                 = string
    env                          = string
    region                       = string
    reference                    = bool
    rg_name                      = string
    computer_name                = string
    size                         = string
    vmIndex                      = string
    username                     = string
    network_interface_name       = string
    os_disk_storage_account_type = string
    os_disk_size_gb              = number
    publisher                    = string
    offer                        = string
    sku                          = string
    version                      = string
    type                         = string
  }))
  description = "key-value map contains the virtual machines attributes"
}
variable "networkInterfaces" {
  type=map(string)
}
variable "adminpass" {
  type=string
  sensitive = true
}
variable "tags" {
  type = object({
      Subscription=string,
      Environment=string
  })
  
}