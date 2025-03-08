resource "aws_lb" "default" {
  name            = "app-lb"
  subnets         = module.vpc_ecs.public_subnets
  security_groups = [module.lb_sg_group.security_group_id]
}

resource "aws_lb_target_group" "reverse_proxy" {
  name        = "do4m-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = module.vpc_ecs.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "reverse_proxy" {
  load_balancer_arn = aws_lb.default.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.reverse_proxy.id
    type             = "forward"
  }
}