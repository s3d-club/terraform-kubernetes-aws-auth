variable "master_role_arn" {
  type = string

  description = <<-EOT
    A master role ARN.
    EOT
}

variable "roles" {
  default = []

  type = list(object({
    rolearn  = string
    rolename = string
    groups   = list(string)
  }))

  description = <<-EOT
    A list of roles.
    EOT
}

variable "users" {
  default = []

  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  description = <<-EOT
    A list of users.
    EOT
}
