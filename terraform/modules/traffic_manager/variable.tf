variable "trafficManager" {
    type = object({
                    subsctiption       = string
                    env               = string
                    resourceGroupName=string
                    routingMethod=string
                    relativeName=string
                    endpoints=list(string)
                  }
                )
  description = "object contains all the traffic manager's attributes"
}
variable "loadBalancerIP" {

  type=map(string)
  description = "map with lb's names and public ip address id "
}
variable "tags" {
  type = object({
      Subscription=string,
      Environment=string
  })
  
}