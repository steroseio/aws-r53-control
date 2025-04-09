output "zone_a_id" {
  description = "The ID of the Route 53 hosted zone for domain-a.com"
  value       = module.zone_a.route53_zone_zone_id[var.zone_a_name]
}

output "zone_b_id" {
  description = "The ID of the Route 53 hosted zone for domain-b.com"
  value       = module.zone_b.route53_zone_zone_id[var.zone_b_name]
}

output "zone_a_records" {
  description = "The records created in zone_a"
  value       = module.records_a.route53_record_fqdn # Outputting FQDNs as an example
}

output "zone_b_records" {
  description = "The records created in zone_b"
  value       = module.records_b.route53_record_fqdn # Outputting FQDNs as an example
}
