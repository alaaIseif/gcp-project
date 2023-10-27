# resource "google_project_service" "compute" {
#     project = var.project_id
#     service = "compute.googleapis.com"
#     disable_dependent_services = true
# }

# resource "google_project_service" "container" {
#     project = var.project_id
#     service = "container.googleapis.com"
#     disable_dependent_services = false
# }

resource "google_compute_network" "main" {
    name = "main-vpc-${var.vpc-region}"
    auto_create_subnetworks = false
    delete_default_routes_on_create = true
    # depends_on = [
    #     google_project_service.compute
    # ]
}
