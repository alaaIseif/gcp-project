# Create managed node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = google_container_cluster.primary.name   
  location   = var.node-pool-location
  cluster    = google_container_cluster.primary.name   
  node_count = 1

    autoscaling {
        min_node_count = 1
        max_node_count = 3
    }

    management {
        auto_repair  = true
        auto_upgrade = true
    }


  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = var.node_machine_type    
    service_account = var.sa-gke-access-email
  }
}


