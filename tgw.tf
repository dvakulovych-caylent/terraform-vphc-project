module "transit_gateway_us_east_1" {
  source                            = "./modules/terraform-aws-transit-gateway"
  providers = {
    aws = aws.use1
  }

  amazon_side_asn                   = "64512"
  auto_accept_shared_attachments    = "enable"

  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose

  tags = local.tags
}

module "transit_gateway_eu_west_2" {
  source                            = "./modules/terraform-aws-transit-gateway"
  providers = {
    aws = aws.euw2
  }

  amazon_side_asn                   = "64512"
  auto_accept_shared_attachments    = "enable"

  contact     = var.contact
  environment = var.environment
  team        = var.team
  purpose     = var.purpose

  tags = local.tags
}

resource "aws_ec2_transit_gateway_peering_attachment" "tgw_peering_us_east_1_to_eu_west_2" {
  peer_transit_gateway_id = module.transit_gateway_eu_west_2.transit_gateway_id
  transit_gateway_id      = module.transit_gateway_us_east_1.transit_gateway_id
  peer_region             = "eu-west-2"
}
