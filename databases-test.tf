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
module "products-service-test" {
  source = "./modules/database"

  database_name = "products-service-test"
  username      = "products-service-test"
  password      = "products-service-test"

  depends_on = [time_sleep.wait_for_rds]

  providers = {
    postgresql = postgresql.test
  }
}
