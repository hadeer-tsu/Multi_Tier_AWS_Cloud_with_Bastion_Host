variable "resource_name" {
  description = "Base name for the instances."
  type        = string
}

variable "private_instance_count" {
  description = "Number of private instances to create."
  type        = number
}

variable "bastion_instance_count" {
  description = "The number of bastion instances to create."
  type        = number
  default     = 1  # or whatever default you prefer
}

variable "user_data" {
  description = "User data script to run on instance launch."
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "The AMI ID to use for the instances."
  type        = string
}

variable "instance_type" {
  description = "The type of instances to launch."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where instances will be launched."
  type        = list(string)
}

variable "key_name" {
  description = "The name of the key pair to use."
  type        = string
}

variable "security_group_ids" {
  description = "Map of security group IDs for the instances."
  type        = map(string)
}

variable "subnet_configs" {
  description = "Configuration for subnets"
  type = map(object({
    cidr_block          = string
    availability_zone   = string  # This is likely what "az" refers to
    assign_public_ip    = optional(bool)
  }))
}
