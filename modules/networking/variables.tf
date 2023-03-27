variable "aws_vpc_cidr_block" {
  description = "The cidr block that will be used for the creation of aws_vpc"
  type        = string
}

variable "aws_subnet_cidr_block" {
  description = "The cidr block that will be used for the creation of first public  aws_subnet"
  type        = string
}


variable "aws_subnet_availability_zone" {
  description = "The availability zone that our subnet will reside"
  type        = string
}

variable "aws_subnet_cidr_block2" {
  description = "The cidr block that will be used for the creation of 2nd public aws_subnet"
  type        = string
}


variable "aws_subnet_availability_zone2" {
  description = "The availability zone that our second  subnet will reside"
  type        = string
}

variable "aws_subnet_cidr_block3" {
  description = "The cidr block that will be used for the creation of 3rd  aws_subnet"
  type        = string
}


variable "aws_subnet_availability_zone3" {
  description = "The availability zone that our 3rd subnet (private)  will reside"
  type        = string
}

variable "aws_subnet_cidr_block4" {
  description = "The cidr block that will be used for the creation of 4th  aws_subnet"
  type        = string
}


variable "aws_subnet_availability_zone4" {
  description = "The availability zone that our 4th  subnet (private)  will reside"
  type        = string
}
