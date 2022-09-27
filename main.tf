data "external" "eks" {
  program = [
    "s3d-eks-update-kubeconfig",
    var.cluster_name,
    var.region,
  ]
}

locals {
  account_id      = split(":", var.master_role_arn)[4]
  master_groups   = ["system:masters"]
  eks_init_result = jsonencode(data.external.eks.result)

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

resource "null_resource" "eks" {
  triggers = { on = local.eks_init_result }

  provisioner "local-exec" {
    environment = {
      eks_init_result = local.eks_init_result
    }

    command = "echo \"$eks_init_result\""
  }
}

resource "kubernetes_config_map" "this" {
  depends_on = [null_resource.eks]
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = local.data
}
