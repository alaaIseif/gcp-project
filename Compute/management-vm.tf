#########################
## GCP Linux VM - Main ##
#########################

# resource "google_compute_address" "static_ip" {
#   name = "ubuntu-vm"
# }

# Bootstrapping Script to Install Apache
data "template_file" "linux-metadata" {
template = <<EOF
sudo apt-get update; 
sudo apt-get install -yq build-essential apache2;
sudo systemctl start apache2;
sudo systemctl enable apache2;
EOF
}

# Create VM
resource "google_compute_instance" "vm_instance" {
  name         = "${var.management-region}-vm"
  zone         = var.management-region
  machine_type = var.linux_instance_type
  tags         = ["allow-ssh"] // this receives the firewall rule

    boot_disk {
    initialize_params {
        image = var.ubuntu_2004_sku
    }
    }

    provisioner "remote-exec" {
    inline = [
        "sudo apt-get update",
        "sudo apt-get install -y docker.io"
    ]
    }

    service_account {
        email  = var.service-account-email
        scopes = ["userinfo-email", "compute-ro"]
    }
    
    network_interface {
    network = var.network-interface
    }
    
    metadata = {
        enable-os-login = "true"
    }

    # access_config {
    # nat_ip = google_compute_address.static_ip.address
    # } 
   
    # metadata_startup_script = data.template_file.linux-metadata.rendered

}