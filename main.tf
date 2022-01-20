terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = var.gcp_credentials

  project = "training-juniors-partner"
  region  = var.region
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
}
