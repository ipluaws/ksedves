variable "cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "task_family" {
  description = "The family of the ECS task"
  type        = string
}

variable "container_image" {
  description = "The container image for the ECS task"
  type        = string
}

variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the security group"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group"
  type        = string
}

