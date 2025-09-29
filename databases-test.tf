# Test databases
module "spring-boot-template-test" {
  source = "./modules/database"

  database_name = "spring-boot-template-test"
  username      = "spring-boot-template-test"
  password      = "spring-boot-template-test"

  depends_on = [time_sleep.wait_for_rds]

  providers = {
    postgresql = postgresql.test
  }
}

module "bank-service-test" {
  source = "./modules/database"

  database_name = "bank-service-test"
  username      = "bank-service-test"
  password      = "bank-service-test"

  depends_on = [time_sleep.wait_for_rds]

  providers = {
    postgresql = postgresql.test
  }
}
