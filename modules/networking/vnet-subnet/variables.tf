# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "virtual_network_name" {
  description = "The name of the virtual network to which to attach the subnet."
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet."
  type        = string
}

variable "address_space" {
  description = "The address space to use for the vnet."
  type        = list(string)
  default     = []
}
variable "address_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = []
}

variable "network_security_group_name" {
  description = "The name of the resource group in which to create the network_security_group."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "service_endpoints" {
  description = "The list of Service endpoints to associate with the subnet."
  type        = list(string)
  default     = []
}

variable "security_rules" {
  description = "List of objects representing security rules."
  type        = list(map(string))
  default     = []
}

variable "custom_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
