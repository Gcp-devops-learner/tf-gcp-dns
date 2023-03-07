locals {
  dns_managed_zone = try(google_dns_managed_zone.dns-managed-zone[0], data.google_dns_managed_zone.dns-managed-zone[0])
  name = var.name
  project_id = var.project_id
  region = var.region
  fqdn = var.fqdn
  names = var.names
  records = var.records
  cnamerecords = var.cnamerecords

}



