resource "google_service_account" "developer" {
  account_id   = var.sa-developer-id
  display_name = "A service account that only developers can ssh to"
  project = "testingsevices"
}

resource "google_service_account_key" "developer-key" {
  service_account_id = google_service_account.developer.name
}
data "google_service_account_key" "developer-key" {
  name            = google_service_account_key.developer-key.name
}