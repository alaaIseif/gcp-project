ami="ami-06e46074ae430fba6"
instance_type="t2.micro"
# workload-region = "us-central1"
management-region = "us-east1"
management-zone = "us-east1-b"
region = [ "us-east1"] #"us-central1",
vpc-region = "us-east1"
# availability_zones=["us-central1-a","us-central1-b","us-central1-c"]
private_subnets_cidr_blocks=["10.2.0.0/16","10.0.0.0/16"]
protocol="tcp"
//////
bucket_name = "iti-dev-tf-state2"
project_id = "testingsevices"
storage_location = "US-EAST1"
///////
management-subnet-name = "management-subnet" #["workload-subnet",]
//////
# Linux VM
linux_instance_type = "f1-micro"
ubuntu_2004_sku = "ubuntu-os-cloud/ubuntu-2004-lts"
/////////////
repository_id = "tf-gcp"
format        = "DOCKER"

sa-developer-email = "management-developer2@testingsevices.iam.gserviceaccount.com"
sa-developer-id = "management-developer2"
# sa-developer-roles = ["roles/artifactregistry.reader",
#                     "roles/iam.serviceAccountTokenCreator" /*Impersonating Service Accounts*/
#                      ,"roles/storage.admin", /*Accessing the bucket*/
#                      "roles/iap.admin", /*Accessing using IAP*/
#                      "roles/iap.settingsAdmin",
#                      "roles/iap.tunnelResourceAccessor"]