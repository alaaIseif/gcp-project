resource "google_artifact_registry_repository" "main" {
  location      = var.storage_location
  repository_id = var.repository_id
  format        = var.format
}