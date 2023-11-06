output "instance_ip" {
  value = google_compute_address.static_ip.address
}

output "instance_name" {
  value = google_compute_instance.vm_instance.name
}

output "db_instance_connection_name" {
  value = google_sql_database_instance.db_instance.connection_name
}
