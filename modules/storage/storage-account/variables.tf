# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "storage_account_name" {
  description = "Specifies the name of the storage account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "account_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "GRS"
}

variable "custom_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
