resource "aws_vpc_endpoint" "vpce" {
  service_name       = "com.amazonaws.${var.aws_region}.${var.service_name}"
  vpc_id             = var.vpc_id
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = [var.sg_id]
  private_dns_enabled = var.private_dns_enabled
}


