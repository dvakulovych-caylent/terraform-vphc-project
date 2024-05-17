locals {
  sharedservices_vpc_cidr_us_east_1 = "172.19.0.0/16"
  sharedservices_vpc_cidr_eu_west_2 = "172.20.0.0/16"
}

module "vpc_sharedservices_us_east_1" {
  source    = "./modules/terraform-aws-vpc"
  providers = {
    aws = aws.use1
  }

  name        = "vpc"
  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose

  cidr        = local.sharedservices_vpc_cidr_us_east_1

  azs              = local.azs_us_east_1
  public_subnets   = [for k, v in local.azs_us_east_1 : cidrsubnet(local.sharedservices_vpc_cidr_us_east_1, 8, k)]
  private_subnets  = [for k, v in local.azs_us_east_1 : cidrsubnet(local.sharedservices_vpc_cidr_us_east_1, 8, k + 10)]

  map_public_ip_on_launch = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  manage_default_network_acl = true
         
  manage_default_route_table = true

  manage_default_security_group = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  nat_eip_tags = var.nat_eip_tags

  tags = local.tags
}

module "vpc_sharedservices_eu_west_2" {
  source    = "./modules/terraform-aws-vpc"
  providers = {
    aws = aws.euw2
  }

  name        = "vpc"
  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose

  cidr        = local.sharedservices_vpc_cidr_eu_west_2

  azs              = local.azs_eu_west_2
  public_subnets   = [for k, v in local.azs_eu_west_2 : cidrsubnet(local.sharedservices_vpc_cidr_eu_west_2, 8, k)]
  private_subnets  = [for k, v in local.azs_eu_west_2 : cidrsubnet(local.sharedservices_vpc_cidr_eu_west_2, 8, k + 10)]

  map_public_ip_on_launch = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  manage_default_network_acl = true
         
  manage_default_route_table = true

  manage_default_security_group = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  nat_eip_tags = var.nat_eip_tags

  tags = local.tags
}