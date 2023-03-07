locals {
  name = "private-dns-cloud"
  project_id = "formlabs-377008"
  region = "us-central1"
  fqdn = "prash.cloud."
  names = [
    "static-ip-address"
  ]
  records = {
    "rec1" = {
      name    = "test123"
      type    = "A"
      rrdatas = module.google_dns_managed_zone.addresses
      ttl     = 60
    }
}

  cnamerecords = {
    "rec1" = {
      type_1    = "CNAME"
      rrdatas_1 = ["rds-magento2-production-formlabs-cloud-encrypted.cchlcddjm6zo.us-east-1.rds.amazonaws.com.prash.cloud."]
      ttl_1     = 300
    }
}

}










# locals {
#   dns_managed_zone = try(google_dns_managed_zone.dns-managed-zone[0], data.google_dns_managed_zone.dns-managed-zone[0])
#   name = "test-dns-cloud"
#   project_id = "formlabs-377008"
#   region = "us-central1"
#   fqdn = "prash.cloud."
# }

