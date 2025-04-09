data "aws_vpc" "selected" {
  filter {
    name   = "tag:${var.vpc_tag_key}"
    values = [var.vpc_tag_value]
  }
}

module "zone_a" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0" # Use a recent version of the module

  zones = {
    (var.zone_a_name) = {
      comment = "Private hosted zone for ${var.zone_a_name}"
      vpc = [
        {
          vpc_id = data.aws_vpc.selected.id
        }
      ]
    }
  }

  tags = merge(
    var.tags,
    {
      for k, v in {
        department   = var.tag_department
        cost_centre  = var.tag_cost_centre
        billing_team = var.tag_billing_team
        territory    = var.tag_territory
      } : k => v if v != null
    }
  )
}

module "records_a" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  # Also pass zone_name which is known at plan time
  zone_name = var.zone_a_name
  # Tell the module's internal data source it's a private zone
  private_zone = true

  # Define records for domain-a.com
  # Add your ~12 records here by extending this list
  records = [
    {
      name    = "example-cname"
      type    = "CNAME"
      ttl     = 300
      records = ["target.example.com"]
    },
    {
      name    = "example-a"
      type    = "A"
      ttl     = 300
      records = ["192.0.2.1"]
    },
    {
      name    = "example-aaaa"
      type    = "AAAA"
      ttl     = 300
      records = ["2001:db8::1"]
    },
    {
      name    = "" # Apex record for MX
      type    = "MX"
      ttl     = 300
      records = [
        "10 mail1.example.com",
        "20 mail2.example.com",
      ]
    },
    # Add more records for domain-a.com here
  ]

  depends_on = [
    module.zone_a
  ]
}

module "zone_b" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    (var.zone_b_name) = {
      comment = "Private hosted zone for ${var.zone_b_name}"
      vpc = [
        {
          vpc_id = data.aws_vpc.selected.id
        }
      ]
    }
  }

  tags = merge(
    var.tags,
    {
      for k, v in {
        department   = var.tag_department
        cost_centre  = var.tag_cost_centre
        billing_team = var.tag_billing_team
        territory    = var.tag_territory
      } : k => v if v != null
    }
  )
}

module "records_b" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  # Also pass zone_name which is known at plan time
  zone_name = var.zone_b_name
  # Tell the module's internal data source it's a private zone
  private_zone = true

  # Define records for domain-b.com
  # Add your ~200 records here by extending this list
  records = [
    {
      name    = "another-cname"
      type    = "CNAME"
      ttl     = 60
      records = ["another.target.example.com"]
    },
    {
      name    = "another-a"
      type    = "A"
      ttl     = 60
      records = ["192.0.2.10"]
    },
    {
      name    = "another-aaaa"
      type    = "AAAA"
      ttl     = 60
      records = ["2001:db8::10"]
    },
    {
      name    = "" # Apex record for MX
      type    = "MX"
      ttl     = 60
      records = [
        "10 mailserver1.example.com",
      ]
    },
    # Add more records for domain-b.com here
  ]

  depends_on = [
    module.zone_b
  ]
}
