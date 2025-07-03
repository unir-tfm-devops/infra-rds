# Create database
resource "postgresql_database" "database" {
  name              = var.database_name
  owner             = "postgres"
  template          = "template0"
  encoding          = "UTF8"
  lc_collate        = "en_US.UTF-8"
  lc_ctype          = "en_US.UTF-8"
  tablespace_name   = "pg_default"
  connection_limit  = -1
  allow_connections = true
}

# Create database user/role
resource "postgresql_role" "user" {
  name     = var.username
  login    = true
  password = var.password
  roles    = []
  search_path = []
  statement_timeout = 0
  inherit = true
  replication = false
  bypass_row_level_security = false
  skip_reassign_owned = false
  skip_drop_role      = false
}

# Grant privileges to user on the database
resource "postgresql_grant" "user_privileges" {
  database    = postgresql_database.database.name
  role        = postgresql_role.user.name
  schema      = "public"
  object_type = "schema"
  privileges  = ["CREATE", "USAGE"]

  depends_on = [postgresql_database.database, postgresql_role.user]
} 