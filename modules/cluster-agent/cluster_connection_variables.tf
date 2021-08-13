variable "cluster_endpoint" {
  type = string

  validation {
    condition     = length(var.cluster_endpoint) > 0
    error_message = "The cluster_endpoint value must NOT be empty or null."
  }
}

variable "cluster_certificate" {
  type = string

  validation {
    condition     = length(var.cluster_certificate) > 0
    error_message = "The cluster_certificate value must NOT be empty or null."
  }
}

variable "cluster_name" {
  type = string

  validation {
    condition     = length(var.cluster_name) > 0
    error_message = "The cluster_name value must NOT be empty or null."
  }
}

variable "cluster_region" {
  type        = string
  description = "Region where cluster is running (needed as an argument for connection)"
  default     = "eu-west-2"
}