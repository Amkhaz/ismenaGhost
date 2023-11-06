resource "google_sql_database_instance" "db_instance" {
  name             = "ghost-db-instance"
  database_version = "MYSQL_5_7"
  region           = "us-east1"
  deletion_protection = false

  settings {
    tier = "db-f1-micro"

  }
}

resource "google_sql_database" "ghost_db" {
  name     = "ghost"
  instance = google_sql_database_instance.db_instance.name
}

resource "google_sql_user" "ghost_user" {
  name     = "ghost"
  instance = google_sql_database_instance.db_instance.name
  password = "a-very-strong-password"
}
