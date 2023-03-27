resource "aws_db_subnet_group" "this" {
  name        = "my-db-subnet-group"
  subnet_ids  = [ var.aws_subnet_id]
}

resource "aws_db_instance" "this" {
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  db_name              = var.aws_db_name
  username             = var.rds_username
  password             = var.rds_password
  db_subnet_group_name = aws_db_subnet_group.this.name

  allocated_storage    = 20
  storage_type         = "gp2"
  backup_retention_period = 0

  vpc_security_group_ids = var.vpc_security_group_ids
}
