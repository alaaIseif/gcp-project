resource "google_compute_subnetwork" "private-workload" {
  name          = var.subnets_names[0]
  ip_cidr_range = var.private_subnets_cidr_blocks[0]
  network       = google_compute_network.main.id
  purpose       = "PRIVATE_NAT"
  region = var.region[0]
}

resource "google_compute_subnetwork" "private-management" {
  name          = var.subnets_names[1]
  ip_cidr_range = var.private_subnets_cidr_blocks[1]
  network       = google_compute_network.main.id
  purpose       = "PRIVATE_NAT"
  region = var.region[1]
}

resource "google_project_service" "project_service" {
  project = var.project_id
  service = "compute.googleapis.com"
}
