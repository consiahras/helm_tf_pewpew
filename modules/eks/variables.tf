variable "aws_eks_cluster_name" {
  description = "The name of the eks cluster"
  type        = string
}

variable "aws_eks_subnet_ids" {
  description = "The list of subnets IDs that eks need to operate, needs to be in at least 2 availability zones"
  type        = list(string)
}



