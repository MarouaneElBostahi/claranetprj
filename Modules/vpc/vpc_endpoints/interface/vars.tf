
variable "aws_region" {
  type = string
}
variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
variable "service_name" {
  type = string
}
variable "sg_id" {
  type = string
}
variable "resource_type" {
  type = string
}

variable "private_dns_enabled" {
  type = string
  default = false
}