variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "The IDs of the public subnets"
  type        = list(string)
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
}

variable "target_group_name" {
  description = "The name of the target group"
  type        = string
}

