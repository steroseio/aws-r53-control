# Replace with your actual values
aws_region      = "eu-west-1" # e.g., "eu-west-2"
vpc_tag_key   = "Name"  # The tag key used to identify your VPC (e.g., "Name", "Environment")
vpc_tag_value = "VPC stage" # The corresponding tag value for your VPC

# You can optionally override default zone names here if needed
# zone_a_name = "my-internal-app.local"
# zone_b_name = "my-other-internal-app.local"

# Optional: Provide values for specific zone tags
# tag_department   = "your-department"
# tag_cost_centre  = "your-cost-centre"
# tag_billing_team = "your-billing-team"
# tag_territory    = "your-territory"