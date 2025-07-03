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
module "products-search-prod" {
  source = "./modules/database"

  database_name = "products-search-prod"
  username      = "products-search-prod"
  password      = "products-search-prod"

  depends_on = [time_sleep.wait_for_rds]

  providers = {
    postgresql = postgresql.prod
  }
}
