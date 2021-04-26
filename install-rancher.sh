#!/bin/bash

export KUBECONFIG=./terraform/kube_config_cluster.yaml

helm repo add jetstack https://charts.jetstack.io
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo update

# Install cert-manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.0.4

# Install rancher

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --create-namespace \
  --set hostname=rancher.aguirresabino.dev \
  --set ingress.tls.source=letsEncrypt \
  --set letsEncrypt.environment=production \
  --set letsEncrypt.email=aguirresabino187@gmail.com \
  --set letsEncrypt.ingress.class=nginx