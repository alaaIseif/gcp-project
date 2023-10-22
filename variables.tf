variable "ami" {}
variable "instance_type" {}
variable "region" {}
variable "vpc-region" {}
variable "management-region" {}
variable "private_subnets_cidr_blocks" {
  type        = list(string)
}
variable "availability_zones" {
  type        = list(string)
}
variable "protocol" {}
variable "subnets_names" {
  type        = list(string)
}

#######################Bucket Variables###########################

variable "bucket_name" {}
variable "storage_location" {}
variable "project_id" {}

#############

variable "linux_instance_type" {}
variable "ubuntu_2004_sku" {}
#############

variable "repository_id" {}
variable "format" {}
variable "sa-developer-email" {}
variable "sa-developer-id" {}
# variable "sa-developer-roles" {
#   type        = list(string)
# }
# variable "service-account-email" {
#     default = ""
# }
variable "network-interface" {
    default = ""
}
variable "vm-service-account" { 
    default = ""
}
# variable "developer-custom-role" {
#     default = ""
# }