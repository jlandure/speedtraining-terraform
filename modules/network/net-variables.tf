variable "vpc_cidr" {
  type        = string
  description = "CIDR to use for the VPC"
}

variable "name_prefix" {
  type        = string
  description = "Prepend resources name with this prefix"
}
