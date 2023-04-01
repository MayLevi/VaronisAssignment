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

variable "tags" {
  type = object({
      Subscription=string,
      Environment=string
  })
  
}