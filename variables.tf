variable "location" {
  description = "Azure region for all resources."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
  default     = "rg-tf-lab"
}

variable "virtual_network_name" {
  description = "Name of the virtual network."
  type        = string
  default     = "vnet-tf-lab"
}

variable "subnet_name" {
  description = "Name of the workload subnet."
  type        = string
  default     = "subnet-workload"
}

variable "network_security_group_name" {
  description = "Name of the network security group."
  type        = string
  default     = "nsg-tf-lab"
}

variable "vnet_address_space" {
  description = "Address spaces for the virtual network."
  type        = list(string)
  default     = ["10.10.0.0/16"]

  validation {
    condition     = length(var.vnet_address_space) > 0 && alltrue([for cidr in var.vnet_address_space : can(cidrnetmask(cidr))])
    error_message = "vnet_address_space must contain at least one valid CIDR block."
  }
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the workload subnet."
  type        = list(string)
  default     = ["10.10.1.0/24"]

  validation {
    condition     = length(var.subnet_address_prefixes) > 0 && alltrue([for cidr in var.subnet_address_prefixes : can(cidrnetmask(cidr))])
    error_message = "subnet_address_prefixes must contain at least one valid CIDR block."
  }
}

variable "https_allowed_source_prefixes" {
  description = "Allowed source prefixes for inbound HTTPS (for example, [\"203.0.113.10/32\"])."
  type        = list(string)
  default     = ["*"]
}

variable "storage_account_prefix" {
  description = "Lowercase alphanumeric prefix for storage account names; 3-18 chars so final name remains <= 24 chars."
  type        = string
  default     = "stlab"

  validation {
    condition     = can(regex("^[a-z0-9]{3,18}$", var.storage_account_prefix))
    error_message = "storage_account_prefix must be 3-18 lowercase alphanumeric characters."
  }
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default = {
    project     = "terraform-azure-lab"
    environment = "lab"
    managed_by  = "terraform"
  }
}
