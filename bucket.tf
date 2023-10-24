resource "google_storage_bucket" "main" {
  name = var.bucket_name
  location = var.storage_location
}