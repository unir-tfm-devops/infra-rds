# Create multiple databases using the database module
module "app_database" {
  source = "./modules/database"

  database_name = "spring_boot_template_db"
  username      = "app_user"
  password      = "app_password_123"
  rds_instance  = time_sleep.wait_for_rds
}

module "analytics_database" {
  source = "./modules/database"

  database_name = "analytics_db"
  username      = "analytics_user"
  password      = "analytics_password_123"
  rds_instance  = time_sleep.wait_for_rds
}

module "test_database" {
  source = "./modules/database"

  database_name = "test_db"
  username      = "test_user"
  password      = "test_password_123"
  rds_instance  = time_sleep.wait_for_rds
}
