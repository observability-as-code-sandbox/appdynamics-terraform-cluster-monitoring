data "google_client_config" "current" {}

provider "helm" {
  alias = "gke_cluster"
  kubernetes {
    host                   = ""
    cluster_ca_certificate = base64decode("")
    token                  = "${data.google_client_config.current.access_token}"
  }
}

resource "helm_release" "appdynamics_cluster_agent" {
  
  provider          = helm.gke_cluster
  name              = "gke-cluster-agent"
  repository        = "https://ciscodevnet.github.io/appdynamics-charts"
  chart             = "cluster-agent"
  namespace         = var.customNamespace
  create_namespace  = true
  timeout           = 300
  atomic            = true
  version           = var.helmReleaseVersion

  values = [ 
    
      yamlencode({"nsToMonitor":["dev"]})

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