resource "aws_route53_zone" "zone" {
  name = var.name

  vpc {
    vpc_id = var.vpc_id
  }
}
