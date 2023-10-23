data "google_project" "current" {}

# data "google_artifact_registry_repository" "my_repository" {
#   project        = data.google_project.current.project_id
#   location       = "us-east1"  
#   repository_id  = var.repository_id
#   depends_on = [ "${var.my_repository}" ]
# }


resource "google_compute_instance" "vm_instance" {
  name         = "main-vpc"
  machine_type = var.linux_instance_type
  tags         = ["allow-ssh"] // this receives the firewall rule
  zone = "us-east1-b"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
#   service_account {
#         email  = var.service-account-email
#         scopes = ["userinfo-email", "compute-ro"]
#   }

   network_interface {
    network = var.network-interface
    subnetwork = var.subnetwork
    access_config {
        nat_ip = var.nat-ip
        } 
    }

  metadata =  {
    enable-oslogin = "TRUE"
  }
  
  metadata_startup_script = <<-EOT
    #!/bin/bash
    echo "Instance provisioned!"

   sudo apt update //installing Docker
   sudo apt install apt-transport-https ca-certificates curl software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
   sudo apt install docker-ce
   sudo usermod -aG docker ubuntu
   su - ubuntu
   docker
  EOT

  connection {
    host = self.network_interface[0].access_config[0].nat_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, world!'",
      "gcloud auth activate-service-account --key-file=${var.developer-key}",
      "gcloud auth configure-docker",
      "docker pull gcr.io/${data.google_project.current.project_id}/nodejs-image:latest",
  
      "docker tag gcr.io/${data.google_project.current.project_id}/nodejs-image:latest ${var.management-region}-docker.pkg.dev/${data.google_project.current.project_id}/${var.my_repository.name}/nodejs-image:latest",
      "docker push ${var.management-region}-docker.pkg.dev/${data.google_project.current.project_id}/${var.my_repository.name}/nodejs-image:latest",
    ]
  }
}