# Create an Amazon EKS cluster
resource "aws_eks_cluster" "eks" {
  name     = var.aws_eks_cluster_name
  role_arn = aws_iam_role.eks.arn
  vpc_config {
    #I dont have any bastion hosts or vpn so i can't access via private endpoint, so i will use public
    endpoint_private_access = false
    endpoint_public_access  = true
    #List of subnets - Must be in at least 2 different availability zones
    subnet_ids = var.aws_eks_subnet_ids 
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks, aws_iam_role.eks 
  ]
}

# Create an IAM role for the EKS cluster
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "eks" {
  name = "eks_cluster_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Attach an IAM policy to the EKS role
resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}


#Creating the aws_eks_node_group  instance groups and policies 
#Creating the role for ec2 instances to be able to use the eks cluster
resource "aws_iam_role" "eks_nodes" {
  name = "eks-node-group-role"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_nodes.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_nodes.name
}



#Creating the aws_eks_node_group 
resource "aws_eks_node_group" "eks_nodes" {
  #name of the EKS cluster
  cluster_name            = aws_eks_cluster.eks.name
  #Name of the EKS Node Group
  node_group_name         = var.node_group_name
  #Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS
  node_role_arn           = aws_iam_role.eks_nodes.arn
  #Subnets that we will use to deploy our worker nodes - ONLY PRIVATES
  subnet_ids              = var.private_subnet_ids
  #Configuration block with scaling settings
  scaling_config {
    #Desired number of worker nodes
    desired_size          = var.workers_desired_size
    #Maximum number of worker nodes
    max_size              = var.workers_max_size
    #Minimum size of worker nodes
    min_size              = var.workers_min_size
  }
  ami_type              = "AL2_x86_64"
  #Capacity associated with EKS Node Group - ON_DEMAND OR SPOT
  capacity_type         = "ON_DEMAND"
  #Disk size in GiB for worker nodes
  disk_size             = 20
  #Force version update if existing pods are unable to be drained 
  force_update_version  = false
  instance_types        = ["t3.small"]

  depends_on  = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ] 
}


