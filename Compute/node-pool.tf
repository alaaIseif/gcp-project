resource "google_container_node_pool" "primary_node" {
 name       = var.node-pool-name             
 location   =  var.node-pool-location                
 node_count = var.node-pool-nodes-count

 cluster    =  google_container_cluster.gke-cluster.name      

 node_config {
    machine_type = var.node_machine_type                                       
    disk_size_gb = var.node_disk_size_gb
    service_account = var.sa-gke-accessor-email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}

