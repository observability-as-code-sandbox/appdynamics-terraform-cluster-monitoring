# Provision an EKS Cluster & Deploy Cluster Agent

This is a Lab containing an example on how to use helm charts to deploy Cluster agent with Terraform.
It is base odn the HashiCorp tutorial used to create AWS EKS cluster, that we connect to and deploy Cluster agent resources.

> Note: Lab still contains manual steps and is work in progress.

### Prerequisites

1) Configure AWS CLI to connect to your AWS environment.

2) Set Terraform variables
    - appdynamics.auto.tfvars
    - cluster_agent.auto.tfvars
    - secrets.auto.tfvars

#### 1 Provision AWS EKS Cluster

Create AWS environment variables, by following the [tutorial](https://learn.hashicorp.com/tutorials/terraform/eks).

[Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster) contains
Terraform configuration files to provision an EKS cluster on AWS.

> Note: It takes about 15-20 min for resources to be deployed to AWS

### 2 Apply scripts to configure kubectl and deploy Cluster agent helm charts
Refer to the `/scripts` folder.

#### 2.1 Configure kubectl to connect to EKS cluster
file: `1-configure-kubectl.sh`

#### 2.2 Apply a metric server
file: `2-metric-server.sh`

#### 2.3 Deploy example applications
Java and Dotnet applications, file: `3-example-applications.sh`

### 3 Deploy Cluster agent
Apply Terraform files from `cluster-agent` folder.

### 4 Do not forget to clean-up the AWS resources

```
tf destroy
```

### Additional links - Zendesk
terraform / helm > manual
https://appdynamics.zendesk.com/agent/tickets/252463
https://appdynamics.zendesk.com/agent/tickets/273864


### HashiCorp tutorial: Learn Terrafom Provision EKS Cluster

Latest version can be cloned from: https://github.com/hashicorp/learn-terraform-provision-eks-cluster