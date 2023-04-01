variable "backend_address_pool" {
  type = map(object({
    lb_name    = string
    vnet_name  = string
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
variable "loadBalancers" {
  type = map(string)
  description = "key-value map contains all the load balancers attributes"
}
variable "vnets" {
  type=map(string)
}
variable "networkInterfaces" {
  type = map(string)
  
}