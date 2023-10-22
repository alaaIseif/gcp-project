ami="ami-06e46074ae430fba6"
instance_type="t2.micro"
workload-region = "us-centeral1"
management-region = "us-east1"
region = ["us-centeral1", "us-us-east1"]
vpc-region = "us-centeral1"
availability_zones=["us-central1-a","us-central1-b","us-central1-c"]
private_subnets_cidr_blocks=["10.2.0.0/16","10.0.0.0/16"]
protocol="tcp"
//////
bucket_name = "iti-dev-tf-state"
project_id = "testingsevices"
storage_location = "US-CENTRAL1"
///////
subnets_names = ["workload-subnet", "management-subnet"]
//////
# Linux VM
linux_instance_type = "f1-micro"
ubuntu_2004_sku = "ubuntu-os-cloud/ubuntu-2004-lts"
/////////////
repository_id = "tf-gcp"
format        = "DOCKER"

sa-developer-email = "sa-iti-tf-dev@testingsevices.iam.gserviceaccount.com"
sa-developer-id = "sa-iti-tf-dev"
# sa-developer-roles = ["roles/artifactregistry.reader",
#                     "roles/iam.serviceAccountTokenCreator" /*Impersonating Service Accounts*/
#                      ,"roles/storage.admin", /*Accessing the bucket*/
#                      "roles/iap.admin", /*Accessing using IAP*/
#                      "roles/iap.settingsAdmin",
#                      "roles/iap.tunnelResourceAccessor"]