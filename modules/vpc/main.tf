resource "google_compute_network" "gke-vpc" {
  name 		                	= "${var.vpc-name}"
  auto_create_subnetworks   = "true"
  mtu                     = 1460
}

resource "google_compute_subnetwork" "gke_subnet" {
 name                     = "${var.subnet-name}"
 ip_cidr_range            = "10.10.0.0/20"
 network                  = google_compute_network.gke-vpc.self_link
 region                   = "${var.region}"
 private_ip_google_access = true
}