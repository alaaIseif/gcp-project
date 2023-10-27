resource "google_compute_router" "vm-router" {
  name    = "iti-vm-router"
  network = google_compute_network.main.id
  region   = var.management-region
}

resource "google_compute_router" "gke-router" {
  name    = "gke-cluster-router"
  network = google_compute_network.main.id
  region  = var.workload-region

}