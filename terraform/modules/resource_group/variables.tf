variable "resourceGroups" {
  type = map(object({
    subsctiption = string
    env          = string
    rgIndex      = string
    region       = string
  }))
  description = "key-value map contains rgs attributes"
}

variable "tags" {
  type = object({
      Subscription=string,
      Environment=string
  })
  
}