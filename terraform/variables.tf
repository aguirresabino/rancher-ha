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

variable "cloudflare_email" {
  sensitive = true
}

variable "cloudflare_api_token" {
  sensitive = true
}

variable "cloudflare_zone_id" {
  sensitive = true
}