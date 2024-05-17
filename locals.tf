locals {
  name        = "${var.team}-${var.environment}"
  name_prefix = "${var.team}-${var.environment}-${var.purpose}"
  region       = var.region

  db_port = 5432
  azs_us_east_1 = slice(data.aws_availability_zones.us_east_1.names, 0, 4)
  azs_eu_west_2 = slice(data.aws_availability_zones.eu_west_2.names, 0, 3)
  resource_prefix = "${var.team}-${var.environment}"

  tags = {
    "purpose"     = var.purpose
    "team"        = var.team
    "environment" = var.environment
    "contact"     = var.contact
    "map-migrated"	= "migSGLMVWRMOV"

  }
}