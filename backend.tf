terraform {
  backend "s3" {
    bucket         = "idp-terraform-stage"       # Your S3 bucket name
    key            = "r53-zones/terraform.tfstate" # Path within the bucket
    region         = "eu-west-1"                 # Use var.aws_region if bucket region matches resource region, otherwise specify correct region
    dynamodb_table = "idp-terraform-stage-lock"  # Your DynamoDB table name
    encrypt        = true                        # Recommended: Enable server-side encryption
  }
}
