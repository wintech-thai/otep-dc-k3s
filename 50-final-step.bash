#!/bin/bash

# Run this after app install on ArgoCD

export $(xargs <.env)

cd 50-final

kubectl apply -f <(cat <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: monitoring
EOF
)

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm template kube-prometheus-crds \
  prometheus-community/kube-prometheus-stack \
  --version 80.5.0 \
  --include-crds \
  --namespace monitoring \
  -f prometheus-values.yaml \
  | kubectl apply -f - --server-side --force-conflicts

cd ..
