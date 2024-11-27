output "arn" {
  description = "security group의 arn"
  value       = aws_security_group.sg.arn
}

output "id" {
  description = "security group의 id"
  value       = aws_security_group.sg.id
}
