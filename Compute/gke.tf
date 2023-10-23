resource "google_container_cluster" "gke-cluster" {
  name     = var.cluster_name
  location = var.workload-region

  remove_default_node_pool = false
  initial_node_count       = 3
  deletion_protection= var.deletion_protection
  
  network    = var.network-interface
  subnetwork = var.workload-subnet-name
  private_cluster_config {
    enable_private_nodes    = var.enable_private_nodes
    master_ipv4_cidr_block =  var.gke_master_ipv4_cidr_block     

  }
}