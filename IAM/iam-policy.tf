# resource "google_project_iam_binding" "project" {
#   project = var.project_id
#   role    = google_project_iam_custom_role.developer-role.name

#   members = [
#       "serviceAccount:${data.google_service_account.developer-sa-data.email}"
#   ]
# }


resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "developer" {
  binding {
    role = google_project_iam_custom_role.developer-role.name
    members = [
      "serviceAccount:${data.google_service_account.developer-sa-data.email}",
      "user:alaa.seif.3112@gmail.com"
    ]
  }
}