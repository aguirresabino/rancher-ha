resource "digitalocean_project" "terraform" {
  name        = var.do_project_name
  description = var.do_project_description
  purpose     = var.do_project_purpose
  environment = var.do_project_environment
  resources   = [
    digitalocean_droplet.rke_nodes[0].urn,
    digitalocean_droplet.rke_nodes[1].urn,
    digitalocean_droplet.rke_nodes[2].urn,
    digitalocean_droplet.lb[0].urn
  ]

  depends_on = [
    digitalocean_droplet.rke_nodes,
    digitalocean_droplet.lb
  ]
}