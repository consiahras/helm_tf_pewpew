variable "aws_eks_cluster_name" {
  description = "The name of the eks cluster"
  type        = string
}

variable "aws_eks_subnet_ids" {
  description = "The list of subnets IDs that eks need to operate, needs to be in at least 2 availability zones"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "The list of the Private subnet IDs that the eks node group will deploy our worker nodes"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name of the aws_eks_node_group"
  type        = string
}

variable "workers_desired_size" {
  description = "The desired number of worker nodes"
  type        = number
}

variable "workers_max_size" {
  description = "The max  number of worker nodes"
  type        = number
}

variable "workers_min_size" {
  description = "the Min number of worker nodes"
  type        = number
}



