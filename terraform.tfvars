# Replace with your actual values
aws_region      = "us-east-1" # e.g., "eu-west-2"
vpc_tag_key   = "Name"  # The tag key used to identify your VPC (e.g., "Name", "Environment")
vpc_tag_value = "your-vpc-name-tag-value" # The corresponding tag value for your VPC

# You can optionally override default zone names here if needed
# zone_a_name = "my-internal-app.local"
# zone_b_name = "my-other-internal-app.local"

# Optional tags for Route 53 resources
# tags = {
#   Environment = "production"
#   Project     = "dns-management"
# }