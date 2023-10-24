variable "management-region" {}
variable "management-zone" {}
variable "linux_instance_type" {}
variable "ubuntu_2004_sku" {}
variable "sa-developer-email" {}
variable "network-interface" {}
variable "subnetwork" {}
variable "nat-ip" {}
variable "project_id" {}
variable "repository_id" {}
variable "my_repository" {}
variable "developer-key" {}

############Workload###############
variable "cluster_name" {}
variable "workload-region" {}
variable "workload-subnet-name" {}

variable "deletion_protection" {}
variable "enable_private_nodes" {}
variable "gke_master_ipv4_cidr_block" {}


variable "sa-gke-accessor-email" {}
variable "sa-gke-accessor-id" {}
variable "node-pool-name" {}
variable "node-pool-location" {}
variable "node-pool-nodes-count" {}

variable "node_machine_type" {}
variable "node_disk_size_gb" {}

