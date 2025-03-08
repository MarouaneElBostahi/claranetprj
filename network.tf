module "secretsmanager_endpoint" {
  source        = "./Modules/vpc/vpc_endpoints/interface"
  aws_region    = data.aws_region.current.name
  vpc_id        = module.vpc_ecs.vpc_id
  subnet_ids    = ["${module.vpc_ecs.private_subnets[0]}"]
  sg_id         = module.endpoint_sg.security_group_id
  private_dns_enabled = true
  service_name  = "secretsmanager"
  resource_type = "secretsmanager"
}

module "cw_endpoint" {
  source        = "./Modules/vpc/vpc_endpoints/interface"
  aws_region    = data.aws_region.current.name
  vpc_id        = module.vpc_ecs.vpc_id
  subnet_ids    = ["${module.vpc_ecs.private_subnets[0]}"]
  sg_id         = module.endpoint_sg.security_group_id
  private_dns_enabled = true
  service_name  = "logs"
  resource_type = "cw-logs"
}

module "ecr_endpoint" {
  source        = "./Modules/vpc/vpc_endpoints/interface"
  aws_region    = data.aws_region.current.name
  vpc_id        = module.vpc_ecs.vpc_id
  subnet_ids    = ["${module.vpc_ecs.private_subnets[0]}"]
  sg_id         = module.endpoint_sg.security_group_id
  private_dns_enabled = true
  service_name  = "ecr.dkr"
  resource_type = "ecr-dkr"
}

module "ecr_api_endpoint" {
  source        = "./Modules/vpc/vpc_endpoints/interface"
  aws_region    = data.aws_region.current.name
  vpc_id        = module.vpc_ecs.vpc_id
  subnet_ids    = ["${module.vpc_ecs.private_subnets[0]}"]
  sg_id         = module.endpoint_sg.security_group_id
  private_dns_enabled = true
  service_name  = "ecr.api"
  resource_type = "ecr-api"
}