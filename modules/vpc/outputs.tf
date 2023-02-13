output "vpc-name" {
  value = google_compute_network.gke-vpc.name
}
output "subnet-name" {
    value = google_compute_subnetwork.gke_subnet.name
}