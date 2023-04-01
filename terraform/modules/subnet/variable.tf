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
variable "tags" {
  type = object({
      Subscription=string,
      Environment=string
  })
  
}