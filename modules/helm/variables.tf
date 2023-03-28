variable "container_image_url" {
  type  = string
  description = "The url of the container image of boring-app"
}

variable "mysql_host" {
  type  = string
  description = "The ip of the mysql host"
}

variable "mysql_user" {
  type  = string
  description = "The mysql user to access the database of boring-app"
}

variable "mysql_password" {
  type  = string
  description = "the mysql user's password"
}

variable "mysql_database" {
  type  = string
  description = "The name of the database that is created by terraform"
}


