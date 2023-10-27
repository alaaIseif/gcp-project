resource "google_compute_subnetwork" "private-management" {
  name          = var.management-subnet-name
  ip_cidr_range = var.private_subnets_cidr_blocks[0]
  network       = google_compute_network.main.id
  purpose       = "PRIVATE_NAT"
  region = var.region[0]
}