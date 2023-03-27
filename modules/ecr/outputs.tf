output "aws_ecr_registry_id" {
  description = "The registry_id of the ecr that got created: "
  value       = aws_ecr_repository.this.registry_id
}

output "aws_ecr_name" {
  description = "the name of the aws_ecr :"
  value       = aws_ecr_repository.this.name
}

output "aws_ecr_arn" {
  description = "Full ARN of the repository: "
  value       = aws_ecr_repository.this.arn
}

output "aws_ecr_url" {
  description = "The URL of the repository : "
  value       = aws_ecr_repository.this.repository_url
}
