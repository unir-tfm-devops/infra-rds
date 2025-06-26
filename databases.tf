# Create multiple databases using the database module
module "spring_boot_template_db" {
  source = "./modules/database"

  database_name = "spring_boot_template_db"
  username      = "spring_boot_template_user"
  password      = "spring_boot_template_password"
  rds_instance  = time_sleep.wait_for_rds
}
