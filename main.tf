module "Network" {
  source = "./Network"
  region = var.region
  private_subnets_cidr_blocks = var.private_subnets_cidr_blocks
#   availability_zones = var.availability_zones
  instance_type = var.instance_type
  ami = var.ami
  protocol = var.protocol
  management-subnet-name = var.management-subnet-name
  developer-service-account-id = module.IAM.developer-service-account-id
  project_id = var.project_id
  management-region = var.management-region
  vpc-region = var.vpc-region
}

module "IAM" {
  source = "./IAM"
  project_id = var.project_id
  sa-developer-email = var.sa-developer-email
  sa-developer-id = var.sa-developer-id
#   sa-developer-roles = var.sa-developer-roles
#   vm-service-account = module.Compute.vm-service-account
#   developer-custom-role = module.IAM.google_project_iam_custom_role.developer
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
}

module "Storage" {
  source = "./Storage"
  storage_location = var.storage_location
  repository_id = var.repository_id
  format        = var.format
  bucket_name = var.bucket_name
  project_id = var.project_id
}