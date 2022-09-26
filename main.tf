locals {
  master_groups = ["system:masters"]

  roles = concat(var.roles, [{
    groups   = local.master_groups
    rolearn  = var.master_role_arn
    username = "master"
  }])

  users = concat(var.users, [{
    groups   = local.master_groups
    userarn  = var.master_user_arn
    username = "master"
  }])
}

resource "kubernetes_config_map" "this" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    "mapRoles" = yamlencode(local.roles)
    "mapUsers" = yamlencode(local.users)
  }
}
