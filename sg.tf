module "lb_sg_group" {
  source = "./Modules/security_groups"

  name        = "secgrp-elb"
  description = "Security group for alb that permit all trafiic in 443"
  vpc_id      = module.vpc_ecs.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp", "http-80-tcp"]
}
module "ecs_rest_api_sg" {
  source      = "./Modules/security_groups"
  name        = "secgrp-ecs_rest_api_sg"
  description = "Security group for ecs that permit access from internet"
  vpc_id      = module.vpc_ecs.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 5000
      to_port     = 5000
      protocol    = "TCP"
      description = "Port 5000 traffic"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      description = "Allow outbound traffic in HTTPS"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "docker_ec2_sg" {
  source      = "./Modules/security_groups"
  name        = "secgrp-docker-ec2"
  description = "Security group for docker ec2 that permit all traffic in outbound"
  vpc_id      = module.vpc_ecs.vpc_id
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "All traffic in outbound"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}

module "endpoint_sg" {
  source      = "./Modules/security_groups"
  name        = "secgrp-endpoint_sg"
  description = "Security group for endpoint that permit access from VPC cidr"
  vpc_id      = module.vpc_ecs.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "TCP"
      description = "Allow Inbound traffic in HTTPS"
      cidr_blocks = module.vpc_ecs.vpc_cidr_block
    }
  ]
}
