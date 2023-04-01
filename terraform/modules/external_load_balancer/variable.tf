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
variable "publicIps" {
  type=map(string)
}
variable "tags" {
  type = object({
      Subscription=string,
      Environment=string
  })
  
}