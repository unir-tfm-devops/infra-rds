resource "aws_db_instance" "postgres_test" {
  identifier        = "unir-tfm-postgres-test"
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "16.8"
  instance_class    = "db.t3.micro"
  multi_az          = false

  db_name  = "postgres"
  username = "postgres"
  password = "postgres"

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
  monitoring_interval    = 0

  tags = {
    Name        = "PostgreSQL RDS Test"
    Environment = "test"
  }
}

resource "aws_db_instance" "postgres_prod" {
  identifier        = "unir-tfm-postgres-prod"
  allocated_storage = 20
  engine            = "postgres"
  engine_version    = "16.8"
  instance_class    = "db.t3.micro"
  multi_az          = false

  db_name  = "postgres"
  username = "postgres"
  password = "postgres"

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.postgres_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
  monitoring_interval    = 0

  tags = {
    Name        = "PostgreSQL RDS Production"
    Environment = "production"
  }
}

# Wait for RDS instances to be fully available
resource "time_sleep" "wait_for_rds" {
  depends_on = [
    aws_db_instance.postgres_test,
    aws_db_instance.postgres_prod,
    module.vpc,
    aws_db_subnet_group.rds_subnet_group,
    aws_security_group.postgres_sg
  ]

  create_duration = "30s"
}
