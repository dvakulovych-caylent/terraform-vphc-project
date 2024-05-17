data "aws_caller_identity" "current" {}

data "aws_availability_zones" "us_east_1" {
  provider = aws.use1
  filter {
    name   = "region-name"
    values = ["us-east-1"]
  }
}

data "aws_availability_zones" "eu_west_2" {
  provider = aws.euw2
  filter {
    name   = "region-name"
    values = ["eu-west-2"]
  }
}