
variable "customNamespace" {
  type = string

  validation {
    condition     = length(var.customNamespace) > 0
    error_message = "The customNamespace value must NOT be empty or null."
  }
}

variable "helmReleaseVersion" {
  type = string
  default = "0.1.14"
}

variable "createServiceAccount" {
  type    = bool
  default = true
}

variable "imageInfo_agentImage" {
  type    = string
  default = "docker.io/appdynamics/cluster-agent"
}

variable "imageInfo_agentTag" {
  type    = string
  default = "latest"
}

variable "imageInfo_operatorImage" {
  type    = string
  default = "docker.io/appdynamics/cluster-agent-operator"
}

variable "imageInfo_operatorTag" {
  type    = string
  default = "latest"
}

variable "imageInfo_imagePullPolicy" {
  type    = string
  default = "IfNotPresent"
}

variable "instrumentationConfig_enabled" {
  type    = bool
  default = false
}

variable "deploymentMode" {
  type    = string
  default = "MASTER"
}
