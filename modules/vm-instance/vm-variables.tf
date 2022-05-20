variable "name_prefix" {
  type        = string
  description = "Prepend resources name with this prefix"
}

variable "vpc_name" {
  type        = string
}

variable "subnet_name" {
  type        = string
}

# variable "ingress_allow" {
#   type        = string
# }

variable "instance_zone" {
  type        = string
}

variable "os_image_family" {
  type        = string
}

variable "os_image_project" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "cloudinit_script_path" {
  type        = string
}
