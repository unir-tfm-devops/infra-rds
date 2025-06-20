resource "aws_db_instance" "postgres" {
  identifier         = "public-postgres-db"
  allocated_storage  = 20
  engine             = "postgres"
  engine_version     = "15.4"
  instance_class     = "db.t3.micro"

  db_name            = "postgres"
  username           = "postgres"
  password           = "postgres"

  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.postgres_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = true

  tags = {
    Name = "PostgreSQL RDS"
  }
}
