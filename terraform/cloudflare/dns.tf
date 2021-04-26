resource "cloudflare_record" "do_lb" {
  zone_id = var.cloudflare_zone_id
  name    = "rancher"
  value   = var.lb_address
  type    = "A"
  ttl     = 3600
}