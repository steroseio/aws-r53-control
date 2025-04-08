# AWS Route 53 Private Hosted Zones Management

This Terraform project manages AWS Route 53 private hosted zones and their associated DNS records using the `terraform-aws-modules/route53/aws` module.

## Structure

- `main.tf`: Defines the Route 53 zones and records.
- `variables.tf`: Contains input variables (e.g., AWS region, VPC ID, zone names).
- `outputs.tf`: Defines outputs (e.g., hosted zone IDs).
- `provider.tf`: Configures the AWS provider.
- `terraform.tfvars`: Contains variable values (**Update with your actual values**).

## Usage

1.  **Update `terraform.tfvars`**: Replace the placeholder values for `aws_region` and `vpc_id` with your specific configuration.
2.  **Initialize Terraform**: `terraform init`
3.  **Plan**: `terraform plan`
4.  **Apply**: `terraform apply`

## Adding Records

To add more DNS records:

1.  Open `main.tf`.
2.  Locate the `module "records_a"` or `module "records_b"` block.
3.  Extend the `records` list within the relevant module block, following the existing map structure for each record type. Ensure record names are appropriate (e.g., use the zone name variable for apex records).