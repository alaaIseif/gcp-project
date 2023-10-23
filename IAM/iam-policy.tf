

resource "google_project_iam_binding" "project" {
  project = var.project_id
    role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.developer.role_id}"
    # role = "roles/owner"
  members = [
      "serviceAccount:${var.sa-developer-email}",
    #   "user:alaa.seif.3112@gmail.com"
  ]
}




# resource "google_project_iam_member" "project" {
#    project = var.project_id
#   role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.developer.role_id}"
#   member  = "serviceAccount:${google_service_account.developer.account_id}"
# }




# data "google_iam_policy" "developer" {
#   binding {
#     role = "projects/${var.project_id}/roles/${google_project_iam_custom_role.developer.role_id}"
#     members = [
#       "serviceAccount:${google_service_account.developer.email}"
#     ]
#   }
# }

# resource "google_project_iam_policy" "developer" {
#   project     = var.project_id
#   policy_data = data.google_iam_policy.developer.policy_data
# }

# data "google_iam_policy" "project-owner" {
#   binding {
#     role = "roles/owner"
#     members = [
#     #   "serviceAccount:${data.google_service_account.developer-sa-data.member}"
#     #   "user:alaa.seif.3112@gmail.com",
#       "serviceAccount:${var.sa-developer-email}"
#     ]
#   }
# }

# resource "google_project_iam_policy" "owner" {
#   project     = var.project_id
#   policy_data = data.google_iam_policy.project-owner.policy_data
# }
