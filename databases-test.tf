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
