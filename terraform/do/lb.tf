resource "digitalocean_droplet" "lb" {
    count = 1
    
    image  = var.instance_image
    name   = "lb-node-${count.index + 1}"
    region = var.region
    size   = var.lb_instance_size
    ssh_keys = [digitalocean_ssh_key.ssh_key.id]
    
    private_networking = true

    tags = var.tags

    provisioner "file" {
        content = data.template_file.nginx_conf.rendered
        destination = "/tmp/nginx.conf"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt install nginx -y",
            "sudo mv /tmp/nginx.conf /etc/nginx/nginx.conf",
            "nginx -s reload"
        ]
    }

    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }
    
    depends_on = [
      digitalocean_droplet.rke_nodes
    ]
}