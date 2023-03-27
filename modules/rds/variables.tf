variable "aws_db_name" {
  description = "The name of the database to create when the DB instance is created: "
  type        = string
}  


variable "rds_username" {
  description = "Set the username in order to login to the rds "
  default     = "admin"
  type        = string
}

variable "rds_password" {
  description = "Set the password in order to login to the rds"
  type        = string
}


variable "aws_subnet_id" {
  description = "the subnet id  where the database will be created"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "the list of vpc security group ids: "
  type        = list(string)
}
