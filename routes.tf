resource "aws_route" "route1" {
  route_table_id         = module.vpc_sharedservices_us_east_1.private_route_table_ids[0]
  destination_cidr_block = "172.20.0.0/16"
  transit_gateway_id     = "tgw-0a153c32a6a980507"
}

resource "aws_route" "route2" {
  route_table_id         = module.vpc_sharedservices_us_east_1.private_route_table_ids[0]
  destination_cidr_block = "172.31.0.0/16"
  transit_gateway_id     = "tgw-0a153c32a6a980507"
}

resource "aws_route" "route3" {
  route_table_id         = module.vpc_sharedservices_us_east_1.private_route_table_ids[0]
  destination_cidr_block = "192.168.192.0/18"
  transit_gateway_id     = "tgw-0a153c32a6a980507"
}

resource "aws_route" "route4" {
  route_table_id         = module.vpc_sharedservices_us_east_1.private_route_table_ids[0]
  destination_cidr_block = "10.2.0.0/16"
  transit_gateway_id     = "tgw-0a153c32a6a980507"
}
