# AWS Route 53 Private Hosted Zones Management

This Terraform project manages AWS Route 53 private hosted zones and their associated DNS records using the `terraform-aws-modules/route53/aws` module.
Terraform state is stored remotely using an S3 backend with DynamoDB for locking.

## Structure

- `main.tf`: Defines the Route 53 zones and records.
- `variables.tf`: Contains input variables (e.g., AWS region, VPC lookup tags, zone names, specific zone tags).
- `outputs.tf`: Defines outputs (e.g., hosted zone IDs).
- `provider.tf`: Configures the AWS provider.
- `backend.tf`: Configures the S3 remote state backend and DynamoDB locking.
- `terraform.tfvars`: Contains variable values (**Update with your actual values**).

## Usage

1.  **Prerequisites**: Ensure you have an S3 bucket (`idp-terraform-stage`) and a DynamoDB table (`idp-terraform-stage-lock`) in the correct AWS region (`eu-west-1` as per `backend.tf`).
2.  **Update `terraform.tfvars`**: Replace the placeholder values for `aws_region`, `vpc_tag_key`, and `vpc_tag_value` with your specific configuration. Optionally, provide values for the specific zone tags (`tag_department`, etc.).
3.  **Initialize Terraform**: `terraform init`. If you previously initialized without the backend, run `terraform init -reconfigure`.
4.  **Plan**: `terraform plan`
5.  **Apply**: `terraform apply`

## Adding Records

To add more DNS records:

1.  Open `main.tf`.
2.  Locate the `module "records_a"` or `module "records_b"` block.
3.  Extend the `records` list within the relevant module block, following the existing map structure for each record type. Ensure record names are appropriate (e.g., use the zone name variable for apex records).