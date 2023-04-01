
module "resource_group" {
  source         = "../modules/resource_group"
  resourceGroups = var.resourceGroups
  tags           = var.tags
}

module "virtual_network" {
  source          = "../modules/virtual_network"
  virtualNetworks = var.virtualNetworks
  tags            = var.tags
  depends_on      = [module.resource_group]
}

module "subnet" {
  source     = "../modules/subnet"
  subnets    = var.subnets
  tags       = var.tags
  depends_on = [module.resource_group, module.virtual_network]
}

module "network_interface" {
  source            = "../modules/network_interface"
  networkInterfaces = var.networkInterfaces
  subnets           = module.subnet.subnet_output
  tags              = var.tags
  depends_on        = [module.subnet, module.resource_group]
}



module "windows_virtual_machine" {
  source                 = "../modules/virtual_machine"
  windowsVirtualMachines = var.windowsVirtualMachines
  networkInterfaces      = module.network_interface.nic_output
  adminpass              = var.vm_pass
  tags                   = var.tags
  depends_on             = [module.network_interface, module.resource_group]
}


module "public_ip" {
  source     = "../modules/public_ip"
  publicIps  = var.publicIps
  depends_on = [module.resource_group]
}

module "load_balancer" {
  source       = "../modules/external_load_balancer"
  loadBalancer = var.loadBalancer
  publicIps    = module.public_ip.pip_output
  tags         = var.tags
  depends_on   = [module.resource_group, module.public_ip]
}
module "load_balancer_backend_pool" {
  source               = "../modules/lb_backend_pool"
  backend_address_pool = var.backend_address_pool
  backends=var.backends
  loadBalancers        = module.load_balancer.load_balancers
  vnets                = module.virtual_network.vnet_output
  networkInterfaces    = module.network_interface.nic_ip_output
  depends_on           = [module.virtual_network, module.network_interface, module.load_balancer]
}
module "traffic_manager" {
  source         = "../modules/traffic_manager"
  trafficManager = var.trafficManager
  loadBalancerIP = module.load_balancer.load_balancers_ipconfig
  tags           = var.tags
  depends_on     = [module.resource_group, module.load_balancer]
}