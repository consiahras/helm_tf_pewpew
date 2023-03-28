variable "rds_password" {
  type        = string
  description = "The password to access the database that we will create"
}

variable "enable_helm_module" {
  type        = number
  description = "count = 0 will disable the module and it wont run, values can be 1 or 0"
  default     = 1
}
