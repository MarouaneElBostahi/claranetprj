module "vpc_ecs" {
  source                = "./Modules/vpc"
  name                  = "ecs-vpc"
  cidr                  = "10.0.0.0/16"
  azs                   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets       = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets        = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  database_subnet_names = ["10.0.201.0/24", "10.0.202.0/24", "10.0.203.0/24"]
  enable_nat_gateway    = true
  enable_vpn_gateway    = false
}
