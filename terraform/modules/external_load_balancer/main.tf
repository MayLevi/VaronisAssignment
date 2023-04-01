resource "azurerm_lb" "external_load_balancer" {
  for_each = var.loadBalancer
  name                = "lbe-${each.value.subsctiption}-${each.value.env}-${lower(each.value.region)}-${each.value.index}"
  location            = each.value.region
  resource_group_name = each.value.rg_name
  sku="Standard"

  frontend_ip_configuration {
    name                 = each.value.ipName
    public_ip_address_id = lookup(var.publicIps,each.value.ipName)
  }
  tags=var.tags
}

