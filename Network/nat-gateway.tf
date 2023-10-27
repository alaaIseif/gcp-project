resource "google_compute_router_nat" "vm-nat" {
  name                               = "vm-router-nat"
  router                             = google_compute_router.vm-router.name
  region                             = google_compute_router.vm-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat
resource "google_compute_router_nat" "gke-nat" {
  name   = "gke-router-nat"
  router = google_compute_router.gke-router.name
  region = var.workload-region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.private-workload.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.my_internal_ip_addr.self_link]
}


resource "google_compute_address" "my_internal_ip_addr" {
  project      = var.project_id
  address_type = "INTERNAL"
  region       = var.workload-region
  subnetwork   = google_compute_subnetwork.private-workload.id
  name         = "internalip"
  address      = "10.0.0.0/16"
  description  = "An internal IP address for my vm"
}