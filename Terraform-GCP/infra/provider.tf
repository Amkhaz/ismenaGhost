#GCP Provider

provider "google" {
  credentials = file("ser/GCP-cred-key.json")
  project = "ghost-terraform-isolutions"
  region  = "us-east1"
}

