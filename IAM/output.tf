output "sa-developer-email" {
  value = google_service_account.developer-vm.email
}

output "developer-service-account-id" {
  value = google_service_account.developer-vm.account_id
}

# output "developer-custom-role" {
#   value = module.IAM.google_project_iam_custom_role.developer-role
# }