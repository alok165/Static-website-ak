<<<<<<< HEAD
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
=======
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
>>>>>>> a107b192ff3e739859e3b09cc5ce87c139bb6a34
}