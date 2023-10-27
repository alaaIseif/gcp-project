data "google_project" "current" {}

data "google_compute_instance" "vm_instance" {
  name = google_compute_instance.vm_instance.name
}

resource "google_compute_instance" "vm_instance" {
  name         = var.vm_name
  machine_type = var.linux_instance_type
  tags         = ["allow-ssh"] // this receives the firewall rule
  zone =  var.management-zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  service_account {
        email  = var.sa-developer-email
        scopes = ["userinfo-email", "compute-ro", "cloud-platform"]
  }

   network_interface {
    network = var.network-interface
    subnetwork = var.subnetwork
    network_ip = var.network_ip
    }

  metadata =  {
    enable-oslogin = "TRUE"
  }
  
  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Instance provisioned!"

   sudo apt update -y
   sudo apt install apt-transport-https ca-certificates curl software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
   sudo apt install docker-ce
   sudo usermod -aG docker ubuntu
   su - ubuntu
   docker
  EOT

#   connection {
#     host = self.network_interface[0].access_config[0].nat_ip
#   }

  provisioner "remote-exec" {
    inline = [
    "echo 'Hello, world!'",
    "gcloud auth activate-service-account --key-file=${var.developer-key}",
    "gcloud auth configure-docker ${var.management-region}-docker.pkg.dev",
    "gcloud auth print-access-token | sudo docker login -u oauth2accesstoken --password-stdin  ${var.management-region}-docker.pkg.dev",
    # install gcp gke auth tools
    "sudo apt-get install kubectl",
    "sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin",

    # authenticate my cluster with gcp 
    "gcloud container clusters ${var.cluster_name} get-credentials  --region ${var.management-region} --project ${var.project_id}",
    
    # "docker pull mongo:7.0-rc",
    "sudo docker pull docker.io/bitnami/mongodb:4.4.4",

    "mongo -u drage -p secretpassword123 --authenticationDatabase mongodb-0.mongodb-headless.database.svc.cluster.local:27017/inventory",
    
    
    "kubectl apply -f ./mongo-k8s",
    "kubectl get service webapp-service",
    "kubectl exec -it mongodb-0 -- mongo",
    "kubectl logs drage-79c95d6b7-bqb4q  -n database",
    "kubectl exec -it mongodb-0  -- mongo",   #-n database   # mongo-pod
    "kubectl exec -it mongo-test-pod -n database -- /bin/bash",    # mongo-client
    # "mongodb://drage:secretpassword123@mongo-0.mongo/test",
 
  
    "docker build -t ${var.management-region}-docker.pkg.dev/${data.google_project.current.project_id}/${var.repository_id}/${var.app_image_name}:${var.app_image_version} ../app",
    # "docker pull ${var.management-region}-docker.pkg.dev/${data.google_project.current.project_id}/${var.repository_id}/${var.app_image_name}:${var.app_image_version}",
    "docker push ${var.management-region}-docker.pkg.dev/${data.google_project.current.project_id}/${var.repository_id}/${var.app_image_name}:${var.app_image_version}",
    
    #Run the Docker container, connecting it to the MongoDB replica set:
    "docker run -d --name node-app   --net mongo-net  -e MONGO_URI=mongodb://drage:secretpassword123@mongo-0.mongo/test?readPreference=nearest&replicaSet=rs0&authSource=admin",
    ]
  }
}