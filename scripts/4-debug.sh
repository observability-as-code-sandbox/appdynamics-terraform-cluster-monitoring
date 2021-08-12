
export TF_LOG=debug
export HELM_DEBUG=1

k get clusteragents.appdynamics.com -n appdynamics-tf-helm -o yaml

k apply clusteragents.appdynamics.com -n appdynamics-tf-helm 




kubectl get clusteragents.appdynamics.com -n appdynamics -o yaml