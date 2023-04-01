vm_pass = "Veronisuser123!"
tags = ({
  "Subscription" : "Varonis",
  "Environment" : "Prod"
})


resourceGroups = {
  rg-eastus = {
    subsctiption = "varonis"
    env          = "prod"
    rgIndex      = "001"
    region       = "EastUS"

  },
  rg-northeu = {
    subsctiption = "varonis"
    env          = "prod"
    rgIndex      = "001"
    region       = "NorthEurope"
  }
}



virtualNetworks = {
  "vnet-eastus" = {
    subsctiption  = "varonis"
    env           = "prod"
    region        = "EastUS"
    vnetIndex     = "001"
    address_space = ["10.101.32.0/24"]
    rg_name       = "rg-varonis-prod-eastus-001"
    dns_servers   = []
  }
  "vnet-northeu" = {

    subsctiption  = "varonis"
    env           = "prod"
    region        = "NorthEurope"
    vnetIndex     = "001"
    address_space = ["10.101.33.0/24"]
    rg_name       = "rg-varonis-prod-northeurope-001"
    dns_servers   = []

  }
}
subnets = {
  "snet-eastus-001" = {
    subsctiption     = "varonis"
    env              = "prod"
    region           = "EastUS"
    subIndex         = "001"
    address_prefixes = ["10.101.32.0/27"]
    rg_name          = "rg-varonis-prod-eastus-001"
    vnet_name        = "vnet-varonis-prod-eastus-001"
  }
  "snet-northeu-001" = {
    subsctiption     = "varonis"
    env              = "prod"
    region           = "NorthEurope"
    subIndex         = "001"
    address_prefixes = ["10.101.33.0/27"]
    rg_name          = "rg-varonis-prod-northeurope-001"
    vnet_name        = "vnet-varonis-prod-northeurope-001"
  }

}



networkInterfaces = {
  "vm1-eastus-nic" = {
    subsctiption = "varonis"
    env          = "prod"
    region       = "EastUS"
    rg_name      = "rg-varonis-prod-eastus-001"
    index        = "001"
    ip_configuration = [{
      ip_configuration_name = "ipconfig"
      subnet_name           = "snet-varonis-prod-eastus-001"
      private_ip            = "10.101.32.5"
    }]

  },
  "vm2-eastus-nic" = {
    subsctiption = "varonis"
    env          = "prod"
    region       = "EastUS"
    rg_name      = "rg-varonis-prod-eastus-001"
    index        = "002"
    ip_configuration = [{
      ip_configuration_name = "ipconfig"
      subnet_name           = "snet-varonis-prod-eastus-001"
      private_ip            = "10.101.32.8"
    }]

  }
  "vm1-northeu-nic" = {
    subsctiption = "varonis"
    env          = "prod"
    region       = "NorthEurope"
    rg_name      = "rg-varonis-prod-northeurope-001"
    index        = "001"
    ip_configuration = [{
      ip_configuration_name = "ipconfig"
      subnet_name           = "snet-varonis-prod-northeurope-001"
      private_ip            = "10.101.33.7"
    }]

  }
  "vm2-northeu-nic" = {
    subsctiption = "varonis"
    env          = "prod"
    region       = "NorthEurope"
    rg_name      = "rg-varonis-prod-northeurope-001"
    index        = "002"
    ip_configuration = [{
      ip_configuration_name = "ipconfig"
      subnet_name           = "snet-varonis-prod-northeurope-001"
      private_ip            = "10.101.33.10"
    }]

  }
}

windowsVirtualMachines = {
  "vm1-eastus" = {
    reference                    = true
    subsctiption                 = "varonis"
    env                          = "prod"
    region                       = "EastUS"
    rg_name                      = "rg-varonis-prod-eastus-001"
    computer_name                = "vm1-eastus"
    size                         = "Standard_B4ms"
    vmIndex                      = "001"
    username                     = "localadmin"
    network_interface_name       = "nic-varonis-prod-eastus-001"
    os_disk_storage_account_type = "StandardSSD_LRS"
    os_disk_size_gb              = 127
    publisher                    = "MicrosoftWindowsServer"
    offer                        = "WindowsServer"
    sku                          = "2016-Datacenter"
    version                      = "latest"
    type                         = "SystemAssigned"
  },
  "vm2-eastus" = {
    reference                    = true
    subsctiption                 = "varonis"
    env                          = "prod"
    region                       = "EastUS"
    rg_name                      = "rg-varonis-prod-eastus-001"
    computer_name                = "vm2-eastus"
    size                         = "Standard_B4ms"
    vmIndex                      = "002"
    username                     = "localadmin"
    network_interface_name       = "nic-varonis-prod-eastus-002"
    os_disk_storage_account_type = "StandardSSD_LRS"
    os_disk_size_gb              = 127
    publisher                    = "MicrosoftWindowsServer"
    offer                        = "WindowsServer"
    sku                          = "2016-Datacenter"
    version                      = "latest"
    type                         = "SystemAssigned"
  },
  "vm1-northeu" = {
    reference                    = true
    subsctiption                 = "varonis"
    env                          = "prod"
    region                       = "NorthEurope"
    rg_name                      = "rg-varonis-prod-northeurope-001"
    computer_name                = "vm1-northeu"
    size                         = "Standard_B4ms"
    vmIndex                      = "001"
    username                     = "localadmin"
    network_interface_name       = "nic-varonis-prod-northeurope-001"
    os_disk_storage_account_type = "StandardSSD_LRS"
    os_disk_size_gb              = 127
    publisher                    = "MicrosoftWindowsServer"
    offer                        = "WindowsServer"
    sku                          = "2016-Datacenter"
    version                      = "latest"
    type                         = "SystemAssigned"
  },
  "vm2-northeu" = {
    reference                    = true
    subsctiption                 = "varonis"
    env                          = "prod"
    region                       = "NorthEurope"
    rg_name                      = "rg-varonis-prod-northeurope-001"
    computer_name                = "vm2-northeu"
    size                         = "Standard_B4ms"
    vmIndex                      = "002"
    username                     = "localadmin"
    network_interface_name       = "nic-varonis-prod-northeurope-002"
    os_disk_storage_account_type = "StandardSSD_LRS"
    os_disk_size_gb              = 127
    publisher                    = "MicrosoftWindowsServer"
    offer                        = "WindowsServer"
    sku                          = "2016-Datacenter"
    version                      = "latest"
    type                         = "SystemAssigned"
  }
}

publicIps = {
  "pip-eastus" = {
    subsctiption      = "varonis"
    env               = "prod"
    region            = "EastUS"
    rg_name           = "rg-varonis-prod-eastus-001"
    pipIndex          = "001"
    allocation_method = "Static"
    sku               = "Standard"
    availability_zone = "No-Zone"
    domain_name_label = "lbe-varonis-prod-eastus-001"
  },
  "pip-northeu" = {
    subsctiption      = "varonis"
    env               = "prod"
    region            = "NorthEurope"
    rg_name           = "rg-varonis-prod-northeurope-001"
    pipIndex          = "001"
    allocation_method = "Static"
    sku               = "Standard"
    availability_zone = "No-Zone"
    domain_name_label = "lbe-varonis-prod-northeurope-001"
  }
}

loadBalancer = {
  "lbe-eastus" = {
    subsctiption = "varonis"
    env          = "prod"
    region       = "EastUS"
    rg_name      = "rg-varonis-prod-eastus-001"
    index        = "001"
    ipName       = "pip-varonis-prod-eastus-001"
  }
  "lbe-northeu" = {
    subsctiption = "varonis"
    env          = "prod"
    region       = "NorthEurope"
    rg_name      = "rg-varonis-prod-northeurope-001"
    index        = "001"
    ipName       = "pip-varonis-prod-northeurope-001"
  }

}
backend_address_pool = {
  "lbe-eastus-backend-pool" = {
    lb_name   = "lbe-varonis-prod-eastus-001"
    vnet_name = "vnet-varonis-prod-eastus-001"
  },
  "lbe-northeurope-backend-pool" = {
    lb_name   = "lbe-varonis-prod-northeurope-001"
    vnet_name = "vnet-varonis-prod-northeurope-001"
  }
}
 backends = [
      {
        vnet_name = "vnet-varonis-prod-eastus-001"
        name             = "lbe-eastus-backend"
        index            = "001"
        backend_resource = "nic-varonis-prod-eastus-001"
      },
      {
        vnet_name = "vnet-varonis-prod-eastus-001"
        name             = "lbe-eastus-backend"
        index            = "002"
        backend_resource = "nic-varonis-prod-eastus-002"
      },
       {
        vnet_name = "vnet-varonis-prod-northeurope-001"
        name             = "lbe-northeurope-backend"
        index            = "001"
        backend_resource = "nic-varonis-prod-northeurope-001"
      },
      {
        vnet_name = "vnet-varonis-prod-northeurope-001"
        name             = "lbe-northeurope-backend"
        index            = "002"
        backend_resource = "nic-varonis-prod-northeurope-002"
      }
    ]

trafficManager = ({
  subsctiption      = "varonis"
  env               = "prod"
  resourceGroupName = "rg-varonis-prod-northeurope-001"
  routingMethod     = "Geographic"
  relativeName      = "varinis"
  endpoints = [
    "lbe-varonis-prod-eastus-001",
    "lbe-varonis-prod-northeurope-001"
  ]
})
