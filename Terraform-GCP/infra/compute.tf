resource "google_compute_instance" "vm_instance" {
  name         = "ghost-vm"
  machine_type = "e2-medium"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size  = 30
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Use the static IP
      nat_ip = google_compute_address.static_ip.address


    }
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  tags = ["http-server", "https-server"]

}

resource "google_compute_address" "static_ip" {
  name   = "ghost-static-ip"
  region = "us-east1"
}

resource "google_compute_firewall" "firewall_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "firewall_https" {
  name    = "allow-https"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https-server"]
}
