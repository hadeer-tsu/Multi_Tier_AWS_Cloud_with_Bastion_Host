variable "vpc_id_input" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
}

variable "az" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "public_ip" {
  description = "Whether to assign a public IP on launch"
  type        = bool
}

variable "subnet_display_name" {
  description = "The name to assign to the subnet"
  type        = string
}