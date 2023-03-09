
variable "project_id" {
  description = "The project ID to manage the DNS resources."
  type        = string
}

variable "name" {
  type        = string
  description = "Name of your DNS zone."
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

# Network Variables

variable "network_name" {
  type    = string
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

variable "routes" {
  type        = list(map(string))
  description = "List of routes being created in this VPC"
  default     = []
}

variable "shared_vpc_host" {
  type        = bool
  description = "Makes this project a Shared VPC host if 'true' (default 'false')"
  default     = false
}

variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}

variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}


variable "mtu" {
  type        = number
  description = "The network MTU. Must be a value between 1460 and 1500 inclusive. If set to 0 (meaning MTU is unset), the network will default to 1460 automatically."
  default     = 0
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ranges" {
  type        = map(list(object({ range_name = string, ip_cidr_range = string })))
  description = "Secondary ranges that will be used in some of the subnets"
  default     = {}
}

variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}

