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
