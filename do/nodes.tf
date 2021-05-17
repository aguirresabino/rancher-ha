resource "digitalocean_droplet" "rke_nodes" {
    count = var.total_rke_nodes
    
    image  = var.instance_image
    name   = "rke-node-${count.index + 1}"
    region = var.region
    size   = var.instance_size
    ssh_keys = [digitalocean_ssh_key.ssh_key.id]
    
    private_networking = true

    tags = var.tags

    provisioner "file" {
        source = "${path.module}/docker.sh"
        destination = "/tmp/docker.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo /sbin/swapoff -a",
            "sudo sed -i '/ swap / s/^/#/' /etc/fstab",
            "sudo chmod +x /tmp/docker.sh",
            "sudo /tmp/docker.sh"
        ]
    }

    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }
}