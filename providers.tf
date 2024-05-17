provider "aws" {
  region = local.region
}

provider "aws" {
  region = "us-east-1"
  alias  = "use1"
}

provider "aws" {
  region = "eu-west-2"
  alias  = "euw2"
}
