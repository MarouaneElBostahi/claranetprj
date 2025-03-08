# module "vm_docker_build" {
#   source                 = "./Modules/ec2"
#   name                   = "ec2_linux_docker_build"
#   iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name
#   instance_type          = "t3a.large"
#   ami                    = "ami-02141377eee7defb9"
#   user_data              = templatefile("./userdata/userdata.sh", local.vars)
#   subnet_id              = module.vpc_ecs.private_subnets[0]
#   vpc_security_group_ids = [module.docker_ec2_sg.security_group_id]
#   root_block_device      = [
#     {
#       volume_type = "gp3"
#       volume_size = 8
#     }
#   ]
# }
