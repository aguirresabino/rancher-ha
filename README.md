<h1 align="center">Welcome to Rancher HA 👋</h1>
<p>
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

> Provisioning Rancher in high availability on DigitalOcean.

## Services / Tools

- Cloudflare
- DigitalOcean
- Ubuntu Server 20.04 x86
- Terraform
- Docker
- Nginx
- Rancher Kubernetes Engine
- Kubernetes
- Helm
- cert-manager

## Introduction

The purpose of this project is to provision a Kubernetes cluster so that we can install the Rancher in high availability mode. The cluster will be created with the [Rancher Kubernetes Engine (RKE)](https://rancher.com/docs/rke/latest/en/), which will facilitate the configuration process. And to automate this process, terraform will be used.

Rancher is an open source project to facilitate container infrastructure management, whether in any cloud service or on-premise environments.


## Install

### Create infrastructure on DigitalOcean
```sh 
# Install required providers
terraform init
# Apply action
terraform apply -auto-approve -var-file="sensitive.tfvars"
```

### Create KUBECONFIG env
```sh
export KUBECONFIG=./kube_config_cluster.yaml
```

### Instal Nginx Ingress Controller bare-metal version

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.46.0/deploy/static/provider/baremetal/deploy.yaml
```

### Add helm repo

```sh
# cert-manager
helm repo add jetstack https://charts.jetstack.io
# rancher
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

helm repo update
```

### Install cert-manager

```sh
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.3.1 \
  --set installCRDs=true
```

### Install Rancher

```sh
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --create-namespace \
  --set hostname=rancher.aguirresabino.dev \
  --set ingress.tls.source=letsEncrypt \
  --set letsEncrypt.environment=production \
  --set letsEncrypt.email=aguirresabino187@gmail.com \
  --set letsEncrypt.ingress.class=nginx
```

Check Rancher deploy status:

```sh
kubectl -n cattle-system rollout status deploy/rancher
```

### Destroy infrastructure

```sh
terraform destroy -auto-approve -var-file="sensitive.tfvars"
```

## Author

👤 **Aguirre Sabino**

* Github: [@aguirresabino](https://github.com/aguirresabino)
* LinkedIn: [@aguirresabino](https://linkedin.com/in/aguirresabino)

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_