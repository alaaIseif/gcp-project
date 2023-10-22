# Configure the GCP Provider
provider "google" {
  project = var.project_id
  region = "us-centeral1-a"
  credentials = file ("key.json")
}