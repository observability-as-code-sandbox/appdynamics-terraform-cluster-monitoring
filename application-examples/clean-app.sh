#!/bin/bash
# This script undeploys the application the from cluster

kubectl -n default delete -f dotnet-deployment.yml
kubectl -n default delete -f java-deployment.yml

# Verify the deployment
echo "========Now running the below pods in test namespace========"
kubectl -n default get pods -o wide

# Delete namespace
#kubectl delete namespace test