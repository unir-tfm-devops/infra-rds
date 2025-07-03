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

module "products-search-api-prod" {
  source = "./modules/database"

  database_name = "products-search-api-prod"
  username      = "products-search-api-prod"
  password      = "products-search-api-prod"

  depends_on = [time_sleep.wait_for_rds]

  provderis = {
    postgresql = postgresql.prod
  }
}
