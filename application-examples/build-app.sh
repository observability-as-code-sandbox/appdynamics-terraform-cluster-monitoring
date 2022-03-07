#!/bin/bash

# Create namespace
#kubectl create namespace test

# Deploy the applications
kubectl -n default apply -f dotnet-deployment.yml
kubectl -n default apply -f java-deployment.yml

sleep 3

# Verify the deployment
kubectl -n default get deployments
kubectl -n default get services

echo "========Now running the below pods in test namespace========"
kubectl -n default get pods -o wide