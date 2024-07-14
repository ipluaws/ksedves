variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
  default     = "united"
}

variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks for the public subnets"
  default     = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks for the private subnets"
  default     = ["10.0.30.0/24", "10.0.40.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  description = "A list of availability zones within your region"
  default     = ["eu-central-1a", "eu-central-1b"]
}

