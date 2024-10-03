terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kubernetes_config_path
  }
}

provider "kubernetes" {
  config_context = var.kubernetes_config_context
  config_path    = var.kubernetes_config_path
}