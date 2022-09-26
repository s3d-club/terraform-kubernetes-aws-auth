variable "master_role_arn" {
  type = string

  description = <<-END
		Users
		https://go.s3d.club/k8-aws-auth#master_role_arn
		END
}

variable "master_user_arn" {
  type = string

  description = <<-END
		Users
		https://go.s3d.club/k8-aws-auth#master_user_arn
		END
}

variable "roles" {
  default = []

  type = list(object({
    rolearn  = string
    rolename = string
    groups   = list(string)
  }))

  description = <<-END
		Roles
		https://go.s3d.club/k8-aws-auth#roles
		END
}

variable "users" {
  default = []

  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  description = <<-END
		Users
		https://go.s3d.club/k8-aws-auth#users
		END
}
