variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "vpc_tag_key" {
  description = "The tag key used to look up the VPC."
  type        = string
}

variable "vpc_tag_value" {
  description = "The tag value used to look up the VPC."
  type        = string
}

variable "zone_a_name" {
  description = "The name of the first private hosted zone."
  type        = string
  default     = "domain-a.com"
}

variable "zone_b_name" {
  description = "The name of the second private hosted zone."
  type        = string
  default     = "domain-b.com"
}

# Optional: Add tags if needed
variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

# Specific tags for zones
variable "tag_department" {
  description = "Value for the 'department' tag."
  type        = string
  default     = null # Or provide a default if applicable
}

variable "tag_cost_centre" {
  description = "Value for the 'cost_centre' tag."
  type        = string
  default     = null
}

variable "tag_billing_team" {
  description = "Value for the 'billing_team' tag."
  type        = string
  default     = null
}

variable "tag_territory" {
  description = "Value for the 'territory' tag."
  type        = string
  default     = null
}
