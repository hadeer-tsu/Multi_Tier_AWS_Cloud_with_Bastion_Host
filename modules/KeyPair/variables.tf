variable "encryption_algorithm" {
  description = "The algorithm to use for the private key (e.g., RSA)"
  type        = string
  default     = "RSA"  # You can set a default value
}

variable "encryption_key_bits" {
  description = "The number of bits for the RSA key"
  type        = number
  default     = 2048  # Default value can be adjusted as needed
}

variable "key_pair_name" {
  description = "The name for the AWS Key Pair and private key file"
  type        = string
}
