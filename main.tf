module "aws_eks" {
    source             = "./modules/aws-eks"
    region             = var.region
    profile            = var.profile
}

module "cluster_agent" {
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
