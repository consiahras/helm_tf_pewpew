#Create a VPC
resource "aws_vpc" "this" {
  cidr_block = var.aws_vpc_cidr_block
  enable_dns_hostnames = true
}

#Create Internet Gateway to allow communication between your vpc and the internet 
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

#Create 2 Elastic IPs that we will use  them on different public subnets for redundancy for our NAT gateways. 
resource "aws_eip" "nat1" {
  depends_on = [ aws_internet_gateway.this ]
}
resource "aws_eip" "nat2" {
  depends_on  = [ aws_internet_gateway.this ]
}


#Create 4 subnets - 2 public and 2 privates
resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.aws_subnet_cidr_block
  availability_zone = var.aws_subnet_availability_zone
  map_public_ip_on_launch = true
  #A Map of tags to assign to the resource, will be used for eks cluster
  tags = {
    Name  = "public-eu-central-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.aws_subnet_cidr_block2
  availability_zone = var.aws_subnet_availability_zone2
  map_public_ip_on_launch = true
  tags = {
    Name  = "public-eu-central-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
    }
}

resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.aws_subnet_cidr_block3
  availability_zone = var.aws_subnet_availability_zone3
  tags  = {
    Name  = "private-eu-central-1a"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_2" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.aws_subnet_cidr_block4
  availability_zone = var.aws_subnet_availability_zone4
  tags  = {
    Name  = "private-eu-central-1b"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

#Creation of the 2 NAT gateways on different public subnets
resource "aws_nat_gateway" "gw1" {
  allocation_id = aws_eip.nat1.id
  subnet_id = aws_subnet.public_1.id
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.public_2.id
}

#Creation of 3 Routing tables, 1 public and 2 private
#Creation of Route table to the default route to Internet Gateway 
resource "aws_route_table" "public" {
  vpc_id  = aws_vpc.this.id
  route {
    #The CIDR of the route.
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.this.id
  }
}


#Private route table, all IP address to target NAT for packages
resource "aws_route_table" "private1" {
  vpc_id  = aws_vpc.this.id
  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.gw1.id
  }
}

resource "aws_route_table" "private2" {
  vpc_id  = aws_vpc.this.id
  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.gw2.id
  }
}

#Route table associations
resource "aws_route_table_association" "public1" {
  subnet_id = aws_subnet.public_1.id
  route_table_id  = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id = aws_subnet.public_2.id
  route_table_id  = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id = aws_subnet.private_1.id
  route_table_id  = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  subnet_id = aws_subnet.private_2.id
  route_table_id  = aws_route_table.private2.id
}

resource "aws_security_group" "this" {
  name_prefix = "aws_sg_http"
  vpc_id      = aws_vpc.this.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
