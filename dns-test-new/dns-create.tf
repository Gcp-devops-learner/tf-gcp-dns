module "google_dns_managed_zone" {
  source       = "../modules/formlabs.com/dns-factory-new/"
  project_id   = local.project_id
  region       = local.region
  name         = local.name
  fqdn         = local.fqdn
  records      = local.records
  cnamerecords = local.cnamerecords
  network_name     = local.network_name
  subnets     = local.subnets
  description = local.description
  secondary_ranges = local.secondary_ranges

}
