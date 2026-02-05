#!/bin/bash

# Run this after app install on ArgoCD

export $(xargs <.env)

kubectl create secret tls otep-provided-tls \
  --cert=$HOME/secrets/otep.crt \
  --key=$HOME/secrets/otep.key \
  -n otep-production
