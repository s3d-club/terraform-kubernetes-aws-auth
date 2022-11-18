terraform {
  required_version = ">=1.3.5"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.15.0"
    }
  }
}
