variable "region" {
  description = "AWS region"

  validation {
    condition     = length(var.region) > 0
    error_message = "The region value must NOT be empty or null."
  }
}

variable "profile" {
  description = "AWS CLI profile"

  validation {
    condition     = length(var.profile) > 0
    error_message = "The profile value must NOT be empty or null."
  }
}