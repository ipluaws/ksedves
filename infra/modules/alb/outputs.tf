output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_lb.demo_alb.arn
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.demo_tg.arn
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.ecs_service.id
}

output "alb_dns_name" {
  value = aws_lb.demo_alb.dns_name
}

