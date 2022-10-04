locals {
  account_id    = split(":", var.master_role_arn)[4]
  master_groups = ["system:masters"]

  data = {
    mapRoles = yamlencode(local.roles)
    mapUsers = yamlencode(local.users)
  }

  roles = concat(var.roles, [{
    groups   = local.master_groups
    rolearn  = var.master_role_arn
    username = "master"
  }])

  users = concat(var.users, [{
    groups   = local.master_groups
    userarn  = "arn:aws:iam::${local.account_id}:root"
    username = "master"
  }])
}

resource "kubernetes_config_map" "this" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = local.data
}
