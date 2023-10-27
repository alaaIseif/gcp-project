///////////////Management Subnet/////////////////////////////
ami="ami-06e46074ae430fba6"
instance_type="t2.micro"
management-region = "us-east1"
management-zone = "us-east1-b"
region = [ "us-east1"] 
vpc-region = "us-east1"
availability_zones=["asia-south2-a", "asia-south2-b", "asia-south2-c"]
private_subnets_cidr_blocks=["10.2.0.0/16", "10.0.0.0/8"]
   //"10.0.0.0/16"] 172.16.0.0/12 192.168.0.0/16
protocol="tcp"
//////
bucket_name = "iti-dev-tf-state2"
project_id = "testingsevices"
storage_location = "US-EAST1"
///////
management-subnet-name = "management-subnet" 
# Linux VM
vm_name = "management-vm"
linux_instance_type = "f1-micro"
ubuntu_2004_sku = "ubuntu-os-cloud/ubuntu-2004-lts"
/////////////
repository_id = "tf-gcp"
app_image_name="nodejs-app-image"
app_image_version ="v1"
format        = "DOCKER"
//////////////////
sa-developer-email = "managementdeveloper@testingsevices.iam.gserviceaccount.com"
sa-developer-id = "managementdeveloper"



////////////////Clusters Variables//////////////////////////////

workload-subnet-name = "workload-subnet"
workload-region = "asia-south2"
cluster_name = "gke-regional-cluster"
sa-gke-access-email = "gke-access@testingsevices.iam.gserviceaccount.com"
sa-gke-access-id = "gke-access"

deletion_protection = "false"
enable_private_nodes = "true"
enable_private_endpoint = "false"
gke_master_ipv4_cidr_block = "172.16.0.0/28" //10.13.0.0/28
node-pool-name = "regional-workload-node-pool"
node-pool-location = "asia-south2"
node-pool-nodes-count = 1
node_machine_type = "e2-micro"
node_disk_size_gb = 10

  