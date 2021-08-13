#!/bin/bash
# This script undeploys the application the from cluster

kubectl -n test delete -f dotnet-deployment.yml
kubectl -n test delete -f java-deployment.yml

# Verify the deployment
echo "========Now running the below pods in test namespace========"
kubectl -n test get pods -o wide

# Delete namespace
kubectl delete namespace test