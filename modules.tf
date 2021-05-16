module "do_nodes" {
  source   = "./do"
  do_token = var.do_token
}

module "cloudflare" {
  source               = "./cloudflare"
  cloudflare_email     = var.cloudflare_email
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_zone_id   = var.cloudflare_zone_id
  lb_address           = module.do_nodes.lb_address[0]
}