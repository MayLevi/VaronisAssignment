resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  for_each = var.backend_address_pool
  loadbalancer_id = lookup(var.loadBalancers,each.value.lb_name)
  name            = each.key
}

resource "azurerm_lb_backend_address_pool_address" "pool_address" {
  count = length(var.backends)
  name                                = "${var.backends[count.index].name}-${var.backends[count.index].index}"
  virtual_network_id=lookup(var.vnets, var.backends[count.index].vnet_name)
  backend_address_pool_id             = azurerm_lb_backend_address_pool.backend_address_pool["${var.backends[count.index].name}-pool"].id
  ip_address= lookup(var.networkInterfaces,var.backends[count.index].backend_resource)
  depends_on = [
    azurerm_lb_backend_address_pool.backend_address_pool
  ]
}