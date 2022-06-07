variable "environment" {
  type = string
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
}

variable "terraform_backend" {
  type = object({
    storage_account_name          = string
    storage_container_name        = string
    storage_container_access_type = string
  })
}

variable "virtual_network" {
  type = object({
    virtual_network_name = string
    address_space        = list(string)

    subnets = object({
      subnet_name                 = string
      address_prefixes            = list(string)
      network_security_group_name = string
    })
  })
}