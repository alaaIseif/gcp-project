# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.workload-region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network-interface
  subnetwork               = var.workload-subnet-name
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes"
  networking_mode          = "VPC_NATIVE"

  # Optional, if you want multi-zonal cluster
  node_locations =  var.availability_zones

  addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

#   workload_identity_config {
#     workload_pool = "devops-v4.svc.id.goog"
#   }

#   ip_allocation_policy {
#     cluster_secondary_range_name  = "k8s-pod-range"
#     services_secondary_range_name = "k8s-service-range"
#   }

  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    enable_private_endpoint = var.enable_private_endpoint
    master_ipv4_cidr_block  = var.gke_master_ipv4_cidr_block
  }

  #   Jenkins use case
  #   master_authorized_networks_config {
  #     cidr_blocks {
  #       cidr_block   = "10.0.0.0/18"
  #       display_name = "private-subnet-w-jenkins"
  #     }
  #   }
}