terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "2.19.2"
    }
  }
}

provider "cloudflare" {
  email = var.cloudflare_email
  api_token = var.cloudflare_api_token
}