# provider "helm" {
#   kubernetes {
#     host                   = var.cluster_endpoint #data.aws_eks_cluster.cluster.endpoint
#     cluster_ca_certificate = base64decode(var.cluster_certificate) # base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
#     exec {
#       api_version = "client.authentication.k8s.io/v1alpha1"
#       args        = ["eks", "get-token", "--cluster-name", var.cluster_name] #data.aws_eks_cluster.cluster.name]
#       command     = "aws"
#     }
#   }
# }

provider "helm" {
  alias = "demo_cluster"
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_certificate)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["--region", var.cluster_region, "eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}

resource "helm_release" "appdynamics_cluster_agent" {
  
  provider          = helm.my_cluster
  name              = "appd-cluster-agent"
  repository        = "https://ciscodevnet.github.io/appdynamics-charts"
  chart             = "cluster-agent"
  namespace         = var.customNamespace
  create_namespace  = true
  timeout           = 300
  atomic            = true
  version           = var.helmReleaseVersion

  values = [ 
    
      yamlencode({"nsToMonitor":[]})

    ]

  set {
    name = "controllerInfo.url"
    value = var.APPDYNAMICS_CONTROLLER_URL
  }

  set {
    name = "controllerInfo.account"
    value = var.APPDYNAMICS_AGENT_ACCOUNT_NAME
  }

  set_sensitive {
    name = "controllerInfo.accessKey"
    value = var.APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY 
  }

  set {
    name = "createServiceAccount"
    value = var.createServiceAccount
  }

  set {
    name = "imageInfo.agentImage"
    value = var.imageInfo_agentImage
  }

  set {
    name = "imageInfo.agentTag"
    value = var.imageInfo_agentTag
  }

  set {
    name = "imageInfo.operatorImage"
    value = var.imageInfo_operatorImage
  }

  set {
    name = "imageInfo.operatorTag"
    value = var.imageInfo_operatorTag
  }

  set {
    name = "imageInfo.imagePullPolicy"
    value = var.imageInfo_imagePullPolicy
  }

  set {
    name = "instrumentationConfig.enabled"
    value = var.instrumentationConfig_enabled
  }

  # set {
  #   name = "deploymentMode"
  #   value = var.deploymentMode
  # }

}