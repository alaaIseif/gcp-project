output "sa-developer-email" {
  value = google_service_account.developer.email
}

output "developer-service-account-id" {
  value = google_service_account.developer.account_id
}

output "developer-key" {
  value = google_service_account_key.developer-key.name
}