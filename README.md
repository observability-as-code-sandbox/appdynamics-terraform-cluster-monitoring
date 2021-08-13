# Using Terraform Provision AWS EKS Cluster (optional) & Deploy Cluster Agent Monitoring

This Lab is containing an example on how to use Helm charts to deploy Cluster Agent with Terraform.

It is based on the HashiCorp [Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster) tutorial containing Terraform configuration files to provision AWS EKS cluster, that then we connect to and deploy Cluster Agent resources using Terraform Helm provider.

> IMPORTANT: Resources created not part of the Free tier. Always destroy created resources when you complete working with the lab, and do not forget to set Billing alerts on your account. Approximate charges: $0.0464/hr, but can accumulate if left unattended.


### Prerequisites

1) Configure AWS CLI to connect to your AWS environment.

2) Set Terraform variables
    - appdynamics.auto.tfvars
    - cluster_agent.auto.tfvars
    - secrets.auto.tfvars


### Provision resources

Project consist of two modules:
- `aws_eks` [`./modules/aws-eks`]: provisioning AWS Elastic Kubernetes Service (EKS) cluster and outputting cluster connection details
- `cluster_agent` [`./modules/cluster-agent`]: deploying AppDynamics Cluster agent to the cluster

> Modules can be used together or independently, and in the case of the latter, cluster connection details can be provided as `.tfvars` file and only `cluster-agent` module targeted for applying.

To create all of the resources run terraform plan and apply:
```
terraform apply
```

> Note: It takes about 10-15 min for resources to be deployed


#### Cluster Agent Updates

When updating Helm values, not to re-create the whole cluster, only a `cluster_agent` module's resource can be targeted for Terraform commands:

```
terraform destroy -target=module.cluster_agent.helm_release.appdynamics_cluster_agent
```

#### Connect to the Cluster

Connecting kubectl to  the newly created cluster, so created pods and other resources can be accessed and managed:

```
aws eks --region $(terraform output -raw cluster_region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

#### Metric Server

To access cluster's hardware metrics, deploy metrics server to the cluster:

```
wget -O v0.3.6.tar.gz https://codeload.github.com/kubernetes-sigs/metrics-server/tar.gz/v0.3.6 && tar -xzf v0.3.6.tar.gz
kubectl apply -f metrics-server-0.3.6/deploy/1.8+/
kubectl get deployment metrics-server -n kube-system
```

> Note: Can be configured as part of the Helm template


#### Example Applications

Directory `./application-examples` contains example deployments to test auto-instrumentation. 
Refer to the `build-app.sh` and `clean-app.sh` scripts.


### Troubleshooting

Set environment variables in order to get more details when troubleshooting:
```
export TF_LOG=debug
export HELM_DEBUG=1
```

Check if cluster agent pods are running, and access cluster agent logs:
```
kubectl get po -n appdynamics
kubectl logs <cluster-agent-pod> -n appdynamics -f
```

###  Destroying Resources

Do not forget to clean-up the AWS resources when you are done:
```
terraform destroy -auto-approve
```


