#!/bin/bash

# Script to create k8s resources

echo "Cleaning old resources"
kubectl delete namespace devsu

echo "Deploying devsu-app in k8s"

echo "Creating Namespace"
kubectl create namespace devsu

echo "Changing current namespace to devsu"
kubectl config set-context --current --namespace devsu

echo "Creating devsu-configmap"
kubectl create configmap devsu-configmap --from-literal=AUTHOR=FelipeGiraldo --from-literal=PURPOSE=TEST

echo "Creating devsu-secret"
kubectl create secret generic devsu-secret --from-literal=CLIENT_ID=998217166 --from-literal=CLIENT_SECRET=19342374234

echo "Creating rbac resources"
kubectl apply -f devsu-rbac.yaml

echo "Creating ingress"
kubectl apply -f devsu-ingress.yaml

echo "Creating service"
kubectl apply -f devsu-service.yaml

echo "Creating deployment"
kubectl apply -f devsu-test-deployment.yaml

echo "All resources were applied successfully!"

