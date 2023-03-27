# Create an Amazon EKS cluster
resource "aws_eks_cluster" "this" {
  name     = var.aws_eks_cluster_name
  role_arn = aws_iam_role.eks.arn
  vpc_config {
    subnet_ids = var.aws_eks_subnet_ids 
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks, aws_iam_role.eks 
  ]
}

# Create an IAM role for the EKS cluster
resource "aws_iam_role" "eks" {
  name = "my-eks-role"
  assume_role_policy = jsonencode({
    Version = "2023-03-27"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

# Attach an IAM policy to the EKS role
resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}

