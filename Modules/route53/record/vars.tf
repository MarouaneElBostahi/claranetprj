variable "zone_id" {
  type = string
}
variable "name" {
  type = string
}
variable "type" {
  type = string
  default = "A"
}
variable "ttl" {
  type = number
  default = 300
}
variable "records" {
  type = list(string)
}
