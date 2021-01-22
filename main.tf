# Configure the Google Cloud provider
provider "google" {
  credentials = "${file("service-account.json")}"
  project = "mihail"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# Create a Google Compute instance
resource "google_compute_instance" "vm_instance" {
  name          = "terraform-instance"
  machine_type  = "f1-micro"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  
  network_interface {
    network = "${google_compute_network.vpc_network.self_link}"

    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_compute_network" "vpc_network" {
    name                    = "terraform-network"
    auto_create_subnetworks = "true"
}
