resource "google_service_account" "developer-vm" {
  account_id   = var.sa-developer-id
  display_name = "A service account that only developers can ssh to"
}

data "google_service_account" "developer-sa-data" {
  account_id   = var.sa-developer-id
}
