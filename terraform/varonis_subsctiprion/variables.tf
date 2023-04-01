
variable "resourceGroups" {
  type = map(object({
    subsctiption = string
    env          = string
    rgIndex      = string
    region       = string
  }))
  description = "key-value map contains rgs attributes"
}

variable "virtualNetworks" {
  type = map(object({
    subsctiption  = string
    env           = string
    region        = string
    vnetIndex     = string
    address_space = list(string)
    rg_name       = string
    dns_servers   = list(string)
  }))
  description = "key-value map contains all the vnets attributes"
}

variable "subnets" {
  type = map(object({
    subsctiption     = string
    env              = string
    region           = string
    subIndex         = string
    address_prefixes = list(string)
    rg_name          = string
    vnet_name        = string
  }))
  description = "key-value map contains all the subnets attributes"
}


variable "networkInterfaces" {
  type = map(object({
    subsctiption = string
    env          = string
    region       = string
    rg_name      = string
    index        = string
    ip_configuration = list(object({
      ip_configuration_name = string
      subnet_name           = string
      private_ip            = string
    }))
  }))
  description = "key-value map contains all the network interfaces attributes"
}
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

variable "publicIps" {
  type = map(object({
    subsctiption      = string
    env               = string
    region            = string
    rg_name           = string
    pipIndex          = string
    allocation_method = string
    sku               = string
    availability_zone = string
    domain_name_label = string
  }))
  description = "key-value map contains all the public IPs attributes"
}
variable "loadBalancer" {
  type = map(object({
    subsctiption = string
    env          = string
    region       = string
    rg_name      = string
    index        = string
    ipName       = string
  }))
  description = "key-value map contains all the load balancers attributes"
}
variable "trafficManager" {
  type = object({
    subsctiption      = string
    env               = string
    resourceGroupName = string
    routingMethod     = string
    relativeName      = string
    endpoints         = list(string)
    }
  )
  description = "object contains all the traffic manager's attributes"
}
variable "vm_pass" {
  type      = string
  sensitive = true
}
variable "tags" {
  type = object({
    Subscription = string,
    Environment  = string
  })

}
variable "backend_address_pool" {
  type = map(object({
    lb_name   = string
    vnet_name = string
  }))
}

variable "backends" {
  type = list(object({
        vnet_name = string
        name             = string
        index            = string
        backend_resource = string
  }))
}