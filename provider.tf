# Configure the GCP Provider
provider "google" {
  project = var.project_id
  region = "us-east1"
  credentials = file ("owner-sa-key.json")
}

# provider "google" {
#   credentials = file("tcb-project-371706-4c5de465c0d5.json")
#   project     = "tcb-project-371706" # Project A
#   region      = "us-east1"
# }

# provider "google" {
    
#   project     = "serviceprojecta-375207" # Project B
#   region      = "us-east1"
#   alias       = "gcp-service-project"
#   credentials = file("serviceprojecta-375207-ed3aefd9fba1.json")
# }

# for usage in resources ->   provider  = google.gcp-service-project
