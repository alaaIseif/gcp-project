resource "google_compute_router_nat" "vm-nat" {
  name                               = "vm-router-nat"
  router                             = google_compute_router.vm-router.name
#   region                             = google_compute_router.vm-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"  //assign an external IP address from the NAT pool
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

   subnetwork {
    name                    = google_compute_subnetwork.private-management.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

