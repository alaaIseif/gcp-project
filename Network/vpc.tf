resource "google_compute_network" "main" {
    name = "main-vpc-${var.vpc-region}"
    auto_create_subnetworks = false
    delete_default_routes_on_create = true
    # depends_on = [
    #     google_project_service.project_service
    # ]
}

resource "google_compute_router" "router" {
  name    = "iti-vm-router"
  network = google_compute_network.main.id
  region   = var.management-region

  bgp {
    asn = 64514
  }
}
