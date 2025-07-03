output "rds_test_endpoint" {
  description = "Test RDS instance endpoint"
  value       = aws_db_instance.postgres_test.endpoint
}

output "rds_prod_endpoint" {
  description = "Production RDS instance endpoint"
  value       = aws_db_instance.postgres_prod.endpoint
}