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

  tags = var.tags
}

module "records_a" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_a_name

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
    {
      name    = "subdomain"
      type    = "NS"
      ttl     = 172800
      records = [
        "ns1.subdomain.example.com",
        "ns2.subdomain.example.com",
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

  tags = var.tags
}

module "records_b" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_b_name

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
    {
      name    = "delegated"
      type    = "NS"
      ttl     = 172800
      records = [
        "ns1.delegated.example.com",
        "ns2.delegated.example.com",
      ]
    },
    # Add more records for domain-b.com here
  ]

  depends_on = [
    module.zone_b
  ]
}
