#!/bin/bash

export $(xargs <.env)

cd 01-bootstrap

kubectl apply -f argocd-app.yaml
kubectl apply -f argocd-ing.yaml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm template kube-prometheus-crds \
  prometheus-community/kube-prometheus-stack \
  --version 80.5.0 \
  --include-crds \
  | kubectl apply -f - --server-side


cd ..
