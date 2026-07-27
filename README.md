# Terraform Azure Lab

A minimal Azure networking and storage lab built with Terraform.

## What This Deploys

- Resource Group
- Virtual Network
- Subnet
- Network Security Group with HTTPS inbound rule
- NSG association to subnet
- Storage Account (globally unique name)

## Prerequisites

- Terraform `>= 1.5`
- Azure CLI logged in (`az login`)
- Permissions to create resources in your Azure subscription

## Quick Start

```bash
terraform init
terraform plan
terraform apply
```

Destroy when done:

```bash
terraform destroy
```

## Customize

All main inputs are parameterized in `variables.tf`.

Common values you may want to change:

- `location`
- `resource_group_name`
- `vnet_address_space`
- `subnet_address_prefixes`
- `https_allowed_source_prefixes`
- `storage_account_prefix`
- `tags`

Example override file:

```hcl
location = "westus2"
resource_group_name = "rg-my-lab"
https_allowed_source_prefixes = ["203.0.113.10/32"]

tags = {
	project     = "terraform-azure-lab"
	environment = "dev"
	owner       = "fitne"
	managed_by  = "terraform"
}
```

Save that as `terraform.tfvars` (or pass with `-var`/`-var-file`).

## Outputs

After apply, Terraform returns useful values such as:

- Resource group name and ID
- VNet ID
- Subnet ID
- Storage account name and ID

## Notes

- This repository is intentionally lab-sized, not production-hardened.
- For team workflows, add a remote backend (Azure Storage) for shared state and locking.
