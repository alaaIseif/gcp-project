resource "google_artifact_registry_repository" "main" {
  repository_id = var.repository_id
  format        = var.format
}


data "google_artifact_registry_repository" "my_repository" {
  project        = var.project_id
  location       = "us-east1"  
  repository_id  = var.repository_id
  depends_on = [ google_artifact_registry_repository.main]
}
