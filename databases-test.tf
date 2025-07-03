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

module "products-search-api-test" {
  source = "./modules/database"

  database_name = "products-search-api-test"
  username = "products-search-api-test"
  password = "products-search-api-test"

  depends_on = [time_sleep.wait_for_rds]

  provderis = {
    postgresql = postgresql.test
  }
}
