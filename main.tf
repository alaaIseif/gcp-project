module "Network" {
  source = "./Network"
  region = var.region
  private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
  instance_type = var.instance_type
  ami = var.ami
  protocol = var.protocol
  management-subnet-name = var.management-subnet-name
  developer-service-account-id = module.IAM.developer-service-account-id
  project_id = var.project_id
  management-region = var.management-region
  vpc-region = var.vpc-region
  workload-region = var.workload-region
}

module "IAM" {
  source = "./IAM"
  project_id = var.project_id
  sa-developer-email = var.sa-developer-email
  sa-developer-id = var.sa-developer-id
  sa-gke-accessor-email = var.sa-gke-accessor-email
  sa-gke-accessor-id = var.sa-gke-accessor-id
  node-pool-name = var.node-pool-name
}

module "Compute" {
    source = "./Compute"
    management-region = var.management-region
    ubuntu_2004_sku = var.ubuntu_2004_sku
    linux_instance_type = var.linux_instance_type
    sa-developer-email =  module.IAM.sa-developer-email
    network-interface = module.Network.vpc_name
    subnetwork = module.Network.subnetwork
    nat-ip = module.Network.nat-ip
    management-zone = var.management-zone
    project_id = var.project_id
    repository_id = module.Storage.repository_id
    my_repository = module.Storage.main_repository
    developer-key = module.IAM.developer-key
    workload-region = var.workload-region
    workload-subnet-name = module.Network.workload-subnetwork
    cluster_name = var.cluster_name
    sa-gke-accessor-email = module.IAM.sa-developer-email
    sa-gke-accessor-id = module.IAM.gke-access-service-account-id
    deletion_protection = var.deletion_protection
    enable_private_nodes = var.enable_private_nodes
    gke_master_ipv4_cidr_block = var.gke_master_ipv4_cidr_block
    node-pool-name = var.node-pool-name
    node-pool-location = var.node-pool-location
    node-pool-nodes-count = var.node-pool-nodes-count
    node_machine_type = var.node_machine_type
    node_disk_size_gb = var.node_disk_size_gb
}

module "Storage" {
  source = "./Storage"
  storage_location = var.storage_location
  repository_id = var.repository_id
  format        = var.format
  bucket_name = var.bucket_name
  project_id = var.project_id
}