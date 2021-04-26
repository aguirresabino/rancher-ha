data "template_file" "nginx_conf" {
    template = file("${path.module}/lb.conf")

    vars = {
        rke_node_1 = digitalocean_droplet.rke_nodes[0].ipv4_address
        rke_node_2 = digitalocean_droplet.rke_nodes[1].ipv4_address
        rke_node_3 = digitalocean_droplet.rke_nodes[2].ipv4_address
    }

    depends_on = [
      digitalocean_droplet.rke_nodes
    ]
}