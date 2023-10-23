###########################
## GCP Linux VM - Output ##
###########################

output "vm-name" {
  value = google_compute_instance.vm_instance.name
}

# output "vm-service-account" {
#   value = google_compute_instance.vm_instance.service_account
# }


# output "vm-external-ip" {
#   value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
# }

# output "vm-internal-ip" {
#   value = google_compute_instance.vm_instance.network_interface.0.network_ip
# }

# output "public_ip" {
#   value = google_compute_address.static_ip.address
# }