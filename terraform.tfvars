///////////////Management Subnet/////////////////////////////
ami="ami-06e46074ae430fba6"
instance_type="t2.micro"
management-region = "us-east1"
management-zone = "us-east1-b"
region = [ "us-east1"] 
vpc-region = "us-east1"
availability_zones=["us-central1-a","us-central1-b","us-central1-c"]
private_subnets_cidr_blocks=["10.2.0.0/16","10.0.0.0/16"]
protocol="tcp"
//////
bucket_name = "iti-dev-tf-state2"
project_id = "testingsevices"
storage_location = "US-EAST1"
///////
management-subnet-name = "management-subnet" 
# Linux VM
linux_instance_type = "f1-micro"
ubuntu_2004_sku = "ubuntu-os-cloud/ubuntu-2004-lts"
/////////////
repository_id = "tf-gcp"
format        = "DOCKER"
//////////////////
sa-developer-email = "management-developer2@testingsevices.iam.gserviceaccount.com"
sa-developer-id = "management-developer2"



////////////////Clusters Variables//////////////////////////////

workload-subnet-name = "workload-subnet"
workload-region = "us-central1"
cluster_name = "gke-regional-cluster"
sa-gke-accessor-email = "gke-accessor@testingsevices.iam.gserviceaccount.com"
sa-gke-accessor-id = "gke-accessor"

deletion_protection = "false"
enable_private_nodes = "true"
gke_master_ipv4_cidr_block = "172.16.0.0/28"
node-pool-name = "regional-workload-node-pool"
node-pool-location = "us-central1"
node-pool-nodes-count = 1
node_machine_type = "e2-micro"
node_disk_size_gb = 10

  