resource "azurerm_public_ip" "public_ip" {
  for_each            = var.publicIps
  name                = "pip-${each.value.subsctiption}-${each.value.env}-${lower(each.value.region)}-${each.value.pipIndex}"
  resource_group_name = each.value.rg_name
  location            = each.value.region
  allocation_method   = each.value.allocation_method  
  sku=each.value.sku

  domain_name_label=each.value.domain_name_label
 
}