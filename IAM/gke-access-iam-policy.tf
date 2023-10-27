resource "google_project_iam_binding" "project-gke-access" {
  project = var.project_id
    role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.gke-access.role_id}"
  members = [
      "serviceAccount:${var.sa-gke-access-email}"
  ]
}