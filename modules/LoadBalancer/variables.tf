variable "load_balancer_name" {
  description = "The name of the load balancer"
  type        = string
}

variable "is_internal" {
  description = "Set to true if the load balancer is internal"
  type        = bool
}

variable "subnet_ids" {
  description = "List of subnet IDs for the load balancer"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the load balancer"
  type        = list(string)
}

variable "resource_name" {
  description = "A base name for all resources"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the load balancer will be created"
  type        = string
}

variable "instance_ids" {
  description = "List of instance IDs to attach to the target group"
  type        = list(string)
}
