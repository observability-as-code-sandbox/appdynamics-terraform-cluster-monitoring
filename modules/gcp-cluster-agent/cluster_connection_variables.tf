# variable "cluster_endpoint" {
#   type = string

#   validation {
#     condition     = length(var.cluster_endpoint) > 0
#     error_message = "The cluster_endpoint value must NOT be empty or null."
#   }
# }

# variable "cluster_ca_certificate" {
#   type = string

#   validation {
#     condition     = length(var.cluster_ca_certificate) > 0
#     error_message = "The cluster_certificate value must NOT be empty or null."
#   }
# }

# variable "cluster_name" {
#   type = string

#   validation {
#     condition     = length(var.cluster_name) > 0
#     error_message = "The cluster_name value must NOT be empty or null."
#   }
# }

# variable "cluster_region" {
#   type        = string
#   description = "Region where cluster is running (needed as an argument for connection)"

#   validation {
#     condition     = length(var.cluster_region) > 0
#     error_message = "The cluster_region value must NOT be empty or null."
#   }
# }

# variable "client_certificate" {
#   type = string

#   # validation {
#   #   condition     = length(var.client_certificate) > 0
#   #   error_message = "The client_certificate value must NOT be empty or null."
#   # }
# }

# variable "client_key" {
#   type = string

#   # validation {
#   #   condition     = length(var.client_key) > 0
#   #   error_message = "The client_key value must NOT be empty or null."
#   # }
# }