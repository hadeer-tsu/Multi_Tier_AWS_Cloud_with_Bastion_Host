variable "vpc_id" {
  description = "The ID of the VPC where the subnets will be created"
  type        = string
}

variable "subnet_configs" {
  description = "A map of subnet configurations, where each key is the subnet name and value is an object containing subnet details"
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    assign_public_ip        = bool
  }))
}
