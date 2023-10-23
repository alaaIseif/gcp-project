resource "google_service_account" "gke-access-sa" {
  account_id   = "gke-access-sa"
  display_name = "Service Account to access GKE"
}
