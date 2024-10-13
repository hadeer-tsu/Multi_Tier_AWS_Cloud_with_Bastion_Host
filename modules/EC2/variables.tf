variable "bastion_instance_count" {
  description = "Number of bastion host instances to create"
  type        = number
}

variable "private_instance_count" {
  description = "Number of private instances to create"
  type        = number
}

variable "ami_id" {
  description = "The AMI ID to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the instances"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the instances"
  type        = list(string)
}

variable "key_name" {
  description = "The name of the key pair to use for the instances"
  type        = string
}

variable "security_group_ids" {
  description = "Map of security group IDs for the instances"
  type        = map(string)
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
}

variable "resource_name" {
  description = "A base name for all resources"
  type        = string
}
