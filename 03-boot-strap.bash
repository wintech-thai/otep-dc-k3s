#!/bin/bash

export $(xargs <.env)

cd 01-bootstrap

kubectl apply -f argocd-app.yaml
kubectl apply -f argocd-ing.yaml
kubectl apply -f app-monitoring-crd.yaml

cd ..
