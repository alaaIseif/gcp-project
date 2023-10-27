variable "ami" {}
variable "instance_type" {}
variable "region" {}
variable "vpc-region" {}
variable "management-region" {}
variable "private_subnets_cidr_blocks" {
  type        = list(string)
}
variable "availability_zones" {
  type        = list(string)
}
variable "protocol" {}
variable "management-subnet-name" {
#   type        = list(string)
}

#######################Bucket Variables###########################

variable "bucket_name" {}
variable "storage_location" {}
variable "project_id" {}

############# VM #############3

variable "linux_instance_type" {}
variable "ubuntu_2004_sku" {}
variable "vm_name" {}
variable "repository_id" {}
variable "app_image_name" {}
variable "app_image_version" {}
variable "format" {}
variable "sa-developer-email" {}
variable "sa-developer-id" {}

variable "network-interface" {
    default = ""
}
variable "subnetwork" {
    default = ""
}
variable "nat-ip" {    
    default = ""
}
variable "network_ip" {    
    default = ""
}
variable "management-zone" {
    default = ""
}
variable "my_repository" {
    default = ""
}
variable "developer-key" {
    default = ""
}

#################Workload Variables###########################
variable "workload-subnet-name" {
    default = ""
}
variable "workload-region" {
    default = ""
}
variable "cluster_name" {}
variable "sa-gke-access-email" {}

variable "sa-gke-access-id" {}

variable "deletion_protection" {}
variable "enable_private_nodes" {}
variable "enable_private_endpoint" {}
variable "gke_master_ipv4_cidr_block" {} 

variable "node-pool-name" {}
variable "node-pool-location" {}
variable "node-pool-nodes-count" {}

variable "node_machine_type" {}
variable "node_disk_size_gb" {}
