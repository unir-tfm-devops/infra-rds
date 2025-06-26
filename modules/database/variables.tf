variable "database_name" {
  description = "Name of the database to create"
  type        = string
}

variable "username" {
  description = "Username for the database user/role"
  type        = string
}

variable "password" {
  description = "Password for the database user/role"
  type        = string
  sensitive   = true
}

variable "rds_instance" {
  description = "The RDS instance resource to depend on"
  type        = any
} 