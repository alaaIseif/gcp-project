resource "google_compute_router" "vm-router" {
  name    = "vm-router"
  network = google_compute_network.main.id
  region   = var.management-region
}
