# `chuckdantonio.com` DNS Automation

Creates the necessary GCP objects to manage DNS for `chuckdantonio.com`

Reuses code from [Hashicorp's example](https://github.com/hashicorp/vault-guides/tree/master/operations/gcp-kms-unseal).

## Using this Repository

To prepare to use this repository, create a service account and 
bucket for Terraform remote state using the script `prepare-remote-state`
The script's in the `bin` directory which `direnv` will put in your
path if you let it.

### Check the variables

Review the values of the Terraform values set in `.envrc` and in [`src/terraform/terraform.tfvars`](src/terraform/terraform.tfvars).

### Create or update the infrastructure

```bash
cd src/terraform
terraform apply
```
