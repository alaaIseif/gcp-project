variable "ami" {}
variable "instance_type" {}
variable "region" {}
variable "vpc-region" {}
variable "private_subnets_cidr_blocks" {
  type        = list(string)
}

variable "management-subnet-name" {}
variable "protocol" {}
variable "developer-service-account-id" {}
variable "project_id" {}
variable "management-region" {}
variable "workload-region" {}