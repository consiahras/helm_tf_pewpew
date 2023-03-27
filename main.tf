#Deployment of Basic Networking
module "aws_networking" {
  source = "./modules/networking"
  aws_vpc_cidr_block               = "192.168.0.0/16"
  aws_subnet_cidr_block            = "192.168.0.0/18"
  aws_subnet_availability_zone     = "eu-central-1a"
  aws_subnet_cidr_block2           = "192.168.64.0/18"
  aws_subnet_availability_zone2    = "eu-central-1b"
  aws_subnet_cidr_block3            = "192.168.128.0/18"
  aws_subnet_availability_zone3    = "eu-central-1a"
  aws_subnet_cidr_block4            = "10.0.192.0/18"
  aws_subnet_availability_zone4    = "eu-central-1b"
}

module "ecr" {
  source  = "./modules/ecr"
  aws_ecr_repository_name         = "boring_ecr"
}

module "rds" {
  source = "./modules/rds" 
  aws_subnet_id                   = "${module.aws_networking.aws_subnet_id}"
  vpc_security_group_ids          = [ "${module.aws_networking.aws_security_group_id}" ]
  aws_db_name                     = "boring_app_db"
  rds_username                    = "admin"
  rds_password                    = var.rds_password
  depends_on = [
    module.aws_networking
  ]
}

module "eks" {
  source = "./modules/eks"
  aws_eks_cluster_name            = "boring_app-eks-cluster"
  aws_eks_subnet_ids              = [
                                      module.aws_networking.aws_subnet_id,
                                      module.aws_networking.aws_subnet_id2,
                                    ]  
  depends_on = [
    module.rds
  ]
}


#module "nginx-controller" {
#  source  = "terraform-iaac/nginx-controller/helm"
#  version = "2.1.1"
  # insert the 1 required variable here
#}
