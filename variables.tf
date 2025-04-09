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
