provider "aws" {
  region = "us-east-1"
}

provider "postgresql" {
  alias           = "test"
  host            = aws_db_instance.postgres_test.address
  port            = 5432
  database        = "postgres"
  username        = aws_db_instance.postgres_test.username
  password        = aws_db_instance.postgres_test.password
  sslmode         = "require"
  connect_timeout = 15
  superuser       = false
}

provider "postgresql" {
  alias           = "prod"
  host            = aws_db_instance.postgres_prod.address
  port            = 5432
  database        = "postgres"
  username        = aws_db_instance.postgres_prod.username
  password        = aws_db_instance.postgres_prod.password
  sslmode         = "require"
  connect_timeout = 15
  superuser       = false
}