output "names" {
  value = digitalocean_droplet.rke_nodes[*].name
}

output "addresses" {
  value = digitalocean_droplet.rke_nodes[*].ipv4_address
}

output "internal_addresses" {
  value = digitalocean_droplet.rke_nodes[*].ipv4_address_private
}

output "tags" {
  value = digitalocean_droplet.rke_nodes[*].tags
}

output "lb_address" {
  value = digitalocean_droplet.lb[*].ipv4_address
}