output "aws_vpc_id" {
  description = "The unique aws id of aws_vpc that got created: "
  value       = aws_vpc.this.id
}

output "aws_vpc_cidr" {
  description = "the aws_vpc CIDR block: "
  value       = aws_vpc.this.cidr_block
}

output "aws_subnet_id" {
  description = "The unique ID of the aws public subnet: "
  value       = aws_subnet.public_1.id
}


output "aws_subnet_cidr" {
  description = "The CIDR block of the aws subnet: "
  value       = aws_subnet.public_1.cidr_block
}

output "aws_subnet_id2" {
  description = "The unique ID of the second  aws public subnet: "
  value       = aws_subnet.public_2.id
}


output "aws_subnet_cidr2" {
  description = "The CIDR block of the second  aws subnet: "
  value       = aws_subnet.public_2.cidr_block
}

output "aws_subnet_id3" {
  description = "The unique ID of the 3rd  aws (private)  subnet: "
  value       = aws_subnet.private_1.id
}


output "aws_subnet_cidr3" {
  description = "The CIDR block of the 3rd  aws subnet: "
  value       = aws_subnet.private_1.cidr_block
}

output "aws_subnet_id4" {
  description = "The unique ID of the 4th aws private subnet: "
  value       = aws_subnet.private_2.id
}


output "aws_subnet_cidr4" {
  description = "The CIDR block of the 4th  aws subnet: "
  value       = aws_subnet.private_2.cidr_block
}


output "aws_security_group_id" {
  description = "the ID of the security group that we created"
  value       =  aws_security_group.this.id 
}
