variable "contact" {
  type        = string
  description = "(Required) The contact for this resource."
}

variable "environment" {
  type        = string
  description = "(Required) The environment where this resource will live."

  validation {
    condition     = contains(["sbx", "dev", "dev-01", "qa", "prod-01", "stage-01", "shared"], var.environment)
    error_message = "Enviroment input value must be one of: [sbx, dev, dev-01, stage-01, qa, prod-01]"
  }
}

variable "team" {
  type        = string
  description = "(Required) The developer team/group this resources are meant for."
}

variable "purpose" {
  type        = string
  description = "(Required) The purpose for this resource."
}

variable "region" {
  type        = string
  description = "(Required) The region for deployment"
  default = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
  default     = {}
}

variable "nat_eip_tags" {
  type = map(any)
  description = "Additional tags to attach to NAT gateways of VPC.  Used for IPAM management purposes."
  default = {
    type = "NAT"
  }
}