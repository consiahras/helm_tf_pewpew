output "db_connect_string" {
  description = "MySQL database connection string"
  value       = "Server=${aws_db_instance.this.address}; Database=;${aws_db_instance.this.db_name} Uid=${var.rds_username}; Pwd=${var.rds_password}"
  sensitive   = true
}

output "db_address" {
  description = "the db instance server address"
  value       = "${aws_db_instance.this.address}"
}


output "db_name" {
  description = "the Database name that created in the db instance"
  value       = "${aws_db_instance.this.db_name}"
}

output "db_uid" {
  description = "the username to access the Database"
  value       = "${var.rds_username}"
}

output "db_password" {
  description = "the password for the user to access the Database"
  value       = "${var.rds_password}"
  sensitive   = true
}
