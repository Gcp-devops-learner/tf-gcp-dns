variable "name" {
  type        = string
  description = "Name of your DNS zone."
}

variable "project_id" {
  description = "The project ID to manage the DNS resources."
  type        = string
}


variable "fqdn" {
  type        = string
  description = "The Full Qualified Domain Name of your DNS zone. If not provided implies that the zone already exist."

  validation {
    condition     = can(regex("^([a-zA-Z0-9. _-])+\\.+$", var.fqdn)) || var.fqdn == ""
    error_message = "Error: your FQDN input is invalid. Please check you didn't forget the final '.' at the end."
  }

  default = ""
}

variable "public" {
  type        = bool
  description = "Visibility of your zone."
  default     = false
}

variable "region" {
  type        = string
  description = "Name of your region"
}
variable "names" {
  description = "A list of IP address resource names to create.  This is the GCP resource name and not the associated hostname of the IP address.  Existing resource names may be found with `gcloud compute addresses list` (e.g. [\"gusw1-dev-fooapp-fe-0001-a-001-ip\"])"
  type        = list(string)
}

variable "records" {
  type = map(object({
    name    = string
    type    = string
    rrdatas = list(string)
    ttl     = number
  }))
  description = "List of your DNS records."
  default     = {}
}

variable "cnamerecords" {
  type = map(object({
 
    type_1    = string
    rrdatas_1 = list(string)
    ttl_1     = number
  }))
  description = "List of your DNS records."
  default     = {}
}