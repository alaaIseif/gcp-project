variable "ami" {}
variable "instance_type" {}
variable "region" {}
variable "vpc-region" {}
variable "management-region" {}
variable "private_subnets_cidr_blocks" {
  type        = list(string)
}
# variable "availability_zones" {
#   type        = list(string)
# }
variable "protocol" {}
variable "management-subnet-name" {
#   type        = list(string)
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

variable "network-interface" {
    default = ""
}
variable "subnetwork" {
    default = ""
}

# variable "vm-service-account" { 
#     default = ""
# }

variable "nat-ip" {    
    default = ""
}
variable "management-zone" {
    default = ""
}


# variable "developer-custom-role" {
#     default = ""
# }
variable "my_repository" {
    default = ""

}
variable "developer-key" {
    default = ""
}

