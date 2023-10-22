output vpc_name {
  value = google_compute_network.main.name
}

output project-compute-service {
    value = google_project_service.project_service.project
}
