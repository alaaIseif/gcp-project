resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

resource "google_compute_network" "main" {
    name = "main-vpc-${var.vpc-region}"
    auto_create_subnetworks = false
    delete_default_routes_on_create = true
    depends_on = [
        google_project_service.compute
    ]
}
