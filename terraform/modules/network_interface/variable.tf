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

variable "subnets" {
  type=map(string)
}
variable "tags" {
  type = object({
      Subscription=string,
      Environment=string
  })
  
}