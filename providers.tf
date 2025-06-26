provider "aws" {
  region = "us-east-1"
}

provider "postgresql" {
  host            = aws_db_instance.postgres.address
  port            = 5432
  database        = "postgres"
  username        = aws_db_instance.postgres.username
  password        = aws_db_instance.postgres.password
  sslmode         = "require"
  connect_timeout = 15
}