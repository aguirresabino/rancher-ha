terraform {
  required_providers {
    rke = {
      source  = "rancher/rke"
      version = "1.2.1"
    }
  }
}

provider "rke" {}

resource "rke_cluster" "cluster" {
  nodes {
    node_name        = "rke-node-1"
    internal_address = module.do_nodes.internal_addresses[0]
    address          = module.do_nodes.addresses[0]
    user             = "root"
    ssh_key          = file(var.pvt_key)
    role             = ["controlplane", "etcd", "worker"]
  }
  nodes {
    node_name        = "rke-node-2"
    internal_address = module.do_nodes.internal_addresses[1]
    address          = module.do_nodes.addresses[1]
    user             = "root"
    ssh_key          = file(var.pvt_key)
    role             = ["controlplane", "etcd", "worker"]
  }
  nodes {
    node_name        = "rke-node-3"
    internal_address = module.do_nodes.internal_addresses[2]
    address          = module.do_nodes.addresses[2]
    user             = "root"
    ssh_key          = file(var.pvt_key)
    role             = ["controlplane", "etcd", "worker"]
  }

  ingress {
    provider = "none"
  }
}

resource "local_file" "kube_cluster_yaml" {
  filename = "./kube_config_cluster.yaml"
  content  = rke_cluster.cluster.kube_config_yaml
}
