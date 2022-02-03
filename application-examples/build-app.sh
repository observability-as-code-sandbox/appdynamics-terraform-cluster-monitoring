#!/bin/bash

# Create namespace
kubectl create namespace test

kubectl create sa appd-account -n test

# Deploy the applications
kubectl -n test apply -f dotnet-deployment.yml
kubectl -n test apply -f java-deployment.yml

sleep 3

# Verify the deployment
kubectl -n test get deployments
kubectl -n test get services

echo "========Now running the below pods in test namespace========"
kubectl -n test get pods -o wide
