resource "azurerm_traffic_manager_profile" "traffic_manager" {
  name                   = "traf-${var.trafficManager.subsctiption}-${var.trafficManager.env}"
  resource_group_name    = var.trafficManager.resourceGroupName
  traffic_routing_method = var.trafficManager.routingMethod

  dns_config {
    relative_name = var.trafficManager.relativeName
    ttl           = 100
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/"
    interval_in_seconds          = 30
    timeout_in_seconds           = 9
    tolerated_number_of_failures = 3
  }

  tags                = var.tags
}
resource "azurerm_traffic_manager_azure_endpoint" "traffic_manager_azure_endpoint" {
  count= length(var.trafficManager.endpoints)
  name               = "trafep-${var.trafficManager.endpoints[count.index]}"
  profile_id         = azurerm_traffic_manager_profile.traffic_manager.id
  weight             = 100
  target_resource_id = lookup(var.loadBalancerIP,var.trafficManager.endpoints[count.index])
}