variable "do_token" {
  description = "DigitalOcean Personal Token"
  sensitive = true
}

variable "pvt_key" {
  description = "Terraform use it to log in DigitalOcean droplets"
  sensitive = true
  default = "~/.ssh/terraform"
}

variable "pub_key" {
  description = "Terraform use it to log in DigitalOcean droplets"
  sensitive = true
  default = "~/.ssh/terraform.pub"
}

variable "ssh_key_name" {
  default = "terraform"
}

variable "do_project_name" {
  default = "Rancher HA"
}

variable "do_project_description" {
  default = "Rancher HA"
}

variable "do_project_purpose" {
  default = "Study"
}

variable "do_project_environment" {
  default = "Development"
}

variable "instance_image" {
  default = "ubuntu-20-04-x64"
}

variable "instance_size" {
  default = "s-8vcpu-16gb"
}

variable "lb_instance_size" {
  default = "s-1vcpu-1gb"
}

variable "region" {
  default = "nyc1"
}

variable "tags" {
  default = ["rancher", "development"]
}