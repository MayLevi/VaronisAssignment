resource "azurerm_resource_group" "resource_group" {
  for_each = var.resourceGroups
  name     = "rg-${each.value.subsctiption}-${each.value.env}-${lower(each.value.region)}-${each.value.rgIndex}"
  location = each.value.region
  tags                = var.tags
}