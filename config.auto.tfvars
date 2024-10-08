location            = "uksouth"
vnet_address_spaces = ["10.0.0.0/16"]
subnet_address_spaces = {
  "shared_data" = {
    name             = "shared_data"
    address_prefixes = ["10.0.0.0/24"]
  }
  "shared_compute" = {
    name             = "shared_compute"
    address_prefixes = ["10.0.1.0/24"]
  }
}
tags = {
  costcode    = "123456"
  owner       = "terraform"
  environment = "dev"
}
network_security_group_rules = {
  default_deny = {
    name                       = "default_deny"
    priority                   = 4000
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  allow_all_outbound = {
    name                       = "allow_all_outbound"
    priority                   = 3000
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}