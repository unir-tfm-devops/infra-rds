# Production databases
module "spring-boot-template-prod" {
  source = "./modules/database"

  database_name = "spring-boot-template-prod"
  username      = "spring-boot-template-prod"
  password      = "spring-boot-template-prod"

  depends_on = [time_sleep.wait_for_rds]

  providers = {
    postgresql = postgresql.prod
  }
}

module "bank-service-prod" {
  source = "./modules/database"

  database_name = "bank-service-prod"
  username      = "bank-service-prod"
  password      = "bank-service-prod"

  depends_on = [time_sleep.wait_for_rds]

  providers = {
    postgresql = postgresql.prod
  }
}
