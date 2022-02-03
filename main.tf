module "aws_eks" {
    source             = "./modules/aws-eks"
    region             = var.region
    profile            = var.profile
}

module "gcp_gke" {
    source             = "./modules/gcp-gke"
    region             = var.region_gcp
    project_id         = var.project_id
}

module "aws_cluster_agent" {
    source                    = "./modules/cluster-agent"

    APPDYNAMICS_AGENT_ACCOUNT_NAME           = var.APPDYNAMICS_AGENT_ACCOUNT_NAME
    APPDYNAMICS_CONTROLLER_URL               = var.APPDYNAMICS_CONTROLLER_URL
    APPDYNAMICS_CONTROLLER_PORT              = var.APPDYNAMICS_CONTROLLER_PORT
    APPDYNAMICS_CONTROLLER_SSL_ENABLED       = var.APPDYNAMICS_CONTROLLER_SSL_ENABLED

    APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY     = var.APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY

    customNamespace           = var.customNamespace
    createServiceAccount      = var.createServiceAccount
    imageInfo_imagePullPolicy = var.imageInfo_imagePullPolicy
    imageInfo_agentTag        = var.imageInfo_agentTag
    imageInfo_operatorTag     = var.imageInfo_operatorTag

    cluster_endpoint          = module.aws_eks.cluster_endpoint
    cluster_certificate       = module.aws_eks.cluster_certificate
    cluster_name              = module.aws_eks.cluster_name
    cluster_region            = module.aws_eks.cluster_region
}

module "gcp_cluster_agent" {
    source                    = "./modules/gcp-cluster-agent"

    APPDYNAMICS_AGENT_ACCOUNT_NAME           = var.APPDYNAMICS_AGENT_ACCOUNT_NAME
    APPDYNAMICS_CONTROLLER_URL               = var.APPDYNAMICS_CONTROLLER_URL
    APPDYNAMICS_CONTROLLER_PORT              = var.APPDYNAMICS_CONTROLLER_PORT
    APPDYNAMICS_CONTROLLER_SSL_ENABLED       = var.APPDYNAMICS_CONTROLLER_SSL_ENABLED

    APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY     = var.APPDYNAMICS_AGENT_ACCOUNT_ACCESS_KEY

    customNamespace           = var.customNamespace
    createServiceAccount      = var.createServiceAccount
    imageInfo_imagePullPolicy = var.imageInfo_imagePullPolicy
    imageInfo_agentTag        = var.imageInfo_agentTag
    imageInfo_operatorTag     = var.imageInfo_operatorTag

    # cluster_endpoint          = module.gcp_gke.cluster_endpoint
    # cluster_ca_certificate    = module.gcp_gke.cluster_ca_certificate
    # client_key                = module.gcp_gke.client_key
    # client_certificate        = module.gcp_gke.client_certificate
    # cluster_name              = module.gcp_gke.cluster_name
    # cluster_region            = module.gcp_gke.cluster_region
}
